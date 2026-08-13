public class OutboundCaseService {
    
    public static HttpResponse getCaseFromOrg1(Id caseId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SalesforceToSalesforce/services/apexrest/Case/5007R00003ZJrcKQAT');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('Response '+response.getBody());
        return response;
    }

}