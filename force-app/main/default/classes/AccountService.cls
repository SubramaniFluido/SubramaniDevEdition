@RestResource(urlMapping='/AccountServiceApi/*')
global class AccountService {
    


    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
		System.debug('req'+req.requestURI);        
        
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account Limit 1];
        return result;
    }
  
}