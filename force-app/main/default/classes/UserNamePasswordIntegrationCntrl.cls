public class UserNamePasswordIntegrationCntrl {
    public String accountSearchName{get;set;}
    Public List<AccountResponse>AccountResponseList{get;set;}
    Public String accessToken{get;set;}
	Public String instanceUrl{get;set;}
    Public String accName{get;set;}
    Public String accType{get;set;}
    Public String accRating{get;set;}
    Public String AccountcreationMsg{get;set;}
    
    
    Public UserNamePasswordIntegrationCntrl(){
        AccountResponseList = new List<AccountResponse>();
    }
    
    Public void requestAccessToken(){
        String accessEndpoint = 'https://login.salesforce.com/services/oauth2/token';
        accessEndpoint= accessEndpoint+'?grant_type=password';
        accessEndpoint= accessEndpoint+'&client_id=3MVG9n_HvETGhr3BOoG8wOY_9tWTf8Qvy87BqXIFfaWMLQrCBCIHxgt0RWDLx.Ozn9c.FiugyTAd21GFRJeax';
        accessEndpoint= accessEndpoint+'&client_secret=7EB33A441594FD43B05C9D2184D51AE55142A0E3B699EDCA5B5F703722DE89E4';
        accessEndpoint= accessEndpoint+'&username=subramanigct@gmail.com.play2';
        accessEndpoint= accessEndpoint+'&password=salesforce@3';
        String username= 'subramanigct@gmail.com.play2';
		String password= 'salesforce@3';
        http ht = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(accessEndpoint);
        request.setMethod('POST');
        Blob headervalue= Blob.valueOf(username+':'+password);
		String authoraizationvalue= 'BASIC'+EncodingUtil.base64Encode(headervalue);
		request.setHeader('Authorization', authoraizationvalue);
        HttpResponse response = ht.send(request);
	
		JSONParser parser= JSON.createParser(response.getBody());

        while(parser.nextToken()!=NULL){
            if((parser.getCurrentToken() == JSONTOKEN.FIELD_NAME) && parser.getText()=='access_token'){
                parser.nextToken();
                accessToken= parser.getText();
            }
        	if(parser.getCurrentToken() == JSONTOKEN.FIELD_NAME && parser.getText() =='instance_url'){
            parser.nextToken();
            instanceUrl= parser.getText();
        	}		
        }
    }
    
    Public void requestAccountDetails(){
        requestAccessToken();
        String serverEndPoint= instanceUrl+'/services/apexrest/AccountService/name='+accountSearchName;
        http ht = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(serverEndPoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        request.setHeader('Content-type', 'application/json');
        HttpResponse response = ht.send(request);
        system.debug('response'+response);
        if(response.getStatusCode()== 200){
            AccountResponseList = (List<AccountResponse>)JSON.deserialize(response.getBody(), List<AccountResponse>.Class);
            system.debug('AccountResponseList'+AccountResponseList);
        }
    }
    
    Public pageReference createAccount(){
        requestAccessToken();
        String serverEndPoint= instanceUrl+'/services/apexrest/AccountService/';
        JSONGenerator js= JSON.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('aname', accName);
        js.writeStringField('aType', accType);
        js.writeStringField('aRating', accRating);
        js.writeEndObject();
        String jsonReq= js.getAsString();
        http ht = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(serverEndPoint);
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        request.setHeader('Content-type', 'application/json');
        request.setBody(jsonReq);
        HttpResponse response = ht.send(request);
        system.debug('response'+response);
        if(response.getStatusCode()== 200){
            AccountcreationMsg= response.getBody();
        }
        return Page.UserNamePasswordIntegration;
        
        
    }
    public class AccountResponse{
        Public String Name{get;set;}
        Public String Type{get;set;}
        Public String Rating{get;set;}
    }
}