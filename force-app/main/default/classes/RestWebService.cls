/**
 * Example of Inbound Integration to Salesforce
 * Create Apex WebService - Expose it through REST Api
 * HTTP Methods - GET, POST, PATCH, DELETE
 * Good Pratice - Always try to Use Global modifier when exposing Web Service - So it can be accessed externally
 * UrlMapping - Resource Identifier. e.g. Domain + UrlMapping = EndPoint
 *
 * Whenever we are setting up any Inbound Integration with Salesforce
 * 1. Authroziatiom - Create Connected App (Monitoring tool) - BEST PRACTICE
 * 2. Authentication - Create a User Account (Username + Password)
 * https://login.salesforce.com/
 *
 * Connected APp Details
 * Consumer Key: 3MVG9n_HvETGhr3AXgdfTQAhPAh1UWGFuhKtJB5pO9BAnqM1Ty_o4DhkFYCFzgl36d0rqmoT2le_om_UrGrk6
 * Consumer Secret: 3661D827A3C7E80FCF7F87C3DAC0012DD1B7D87CD6979D7B3CC6934735996299
 */
@RestResource(urlmapping='/CaseManager/*')
global with sharing class RestWebService {
	/**
	 * This Method is exposing Case record by their Salesforce Id
	 * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5002w000003zzJxAAI
	 * HttpMethod - GET
     * Return Type of GET Method is very important as it will be transmitted as Response
	 */
	@HttpGet
	global static Case getCasebyId() {
		// grab the caseId from the end of tyhe URL
		RestRequest request = RestContext.request;
		String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
		System.debug('Case RecordId : ' + caseId);
		Case result = [
			SELECT CaseNumber, Status, Subject, Origin, Priority, Description
			FROM Case
			WHERE Id = :caseId
		];
		System.debug('Case Record : ' + result);
		return result;
	}

	/**
	 * This Method is deleting Case record by their Salesforce Id
	 * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5002w000003zzJxAAI
	 * HTTP Method - DELETE
     * Create Success & Fail Response with dynmaic Status Code and Body
	 */
	@HttpDelete
	global static void deleteCase() {
		RestRequest request = RestContext.request;
		String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
		List<Case> result = [SELECT Id FROM Case WHERE Id = :caseId];
		RestResponse response = RestContext.response;
		if (!result.isEmpty()) {
			delete result[0];
			response.statusCode = 204;
		} else {
			response.statusCode = 404;
			response.responseBody = Blob.valueOf('Error encountered, Record doesnot exist ! :(');
		}
	}

    /**
     * This method is creating Case record by parsing all required parameters from request
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/CaseManager/
     * Http Method - POST
     * Request Body - { 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx' }
     * Return meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxxxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxxx'}
     */
    @HttpPost
    global static void createCase(String subject, String description, String status, String priority, String origin){
        //Get Incoming REST Callout Request Context
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        //Create Case Sobject
        Case newRec = new Case();
        newRec.Subject = subject;
        newRec.Description = description;
        newRec.Status = status;
        newRec.Priority = priority;
        newRec.Origin = origin;

        //Prepare Response Content
        response.addHeader('Content-Type', 'application/json;charset=utf-8');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            //insert Case record
            insert newRec;
            response.statusCode = 201;
            //Successful Insertion will make Id field populate
            responseContent.id = newRec.Id;
            responseContent.status = 'Success';
            responseContent.errorMessage = '';

        } catch (Exception ex) {
            response.statusCode = 404;
            responseContent.id = '';
            responseContent.status = 'Failure';
            responseContent.errorMessage = ex.getMessage();
        }

        //Convert Wrapper to JSON String
        String responseBody = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseBody);

    }

    public class PostResponseWrapper {
        public String id;
        public String status;
        public String errorMessage;
    }

    /**
     * This method is upsert (update/insert) Case record by parsing all required parameters from request.
     * Incase of Upsert, if Salesforce Id is provided then it is Upsdate scenario. If not, it is an insert scenario
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/CaseManager/
     * Http Method - PUT
     * Request Body - { 'id' : 'xxxx', 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx' }
     * Return meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxxxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxxx'}
     */
    @HttpPut
    global static void upsertCase(){
        //Get Incoming Invbound REST Api Request Current Context
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        //Extract Information/data from Request Body by deserailizing JSON
        String requestBody = request.requestBody.toString();
        PutRequestWrapper requestContent = (PutRequestWrapper) JSON.deserialize(requestBody, PutRequestWrapper.class);

        //Prepare case Object record
        Case newRec = new Case();
        newRec.Id = requestContent.id;
        newRec.Status = requestContent.status;
        newRec.Subject = requestContent.subject;
        newRec.Description = requestContent.description;
        newRec.Origin = requestContent.origin;
        newRec.Priority = requestContent.priority;

        //Prepare Response Content
        response.addHeader('Content-Type', 'application/json');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            //Upsert Operation
            upsert newRec;
            response.statusCode = 201;

            //Success Response
            responseContent.status = 'Success';
            responseContent.id = newRec.Id;
            responseContent.errorMessage = '';
        } catch (Exception ex) {
            //Error Response
            response.statusCode = 404;
            responseContent.status = 'Failed';
            responseContent.id = '';
            responseContent.errorMessage = ex.getMessage();
        }

        //JSON Serialise
        String responseJSON = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseJSON);

    }

    //Wrapper Class to be used for Deserialization
    public class PutRequestWrapper {
        public String id;
        public String subject;
        public String description;
        public String priority;
        public String origin;
        public String status;
    }

}