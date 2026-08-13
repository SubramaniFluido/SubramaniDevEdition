@RestResource(urlMapping='/Accounts/*/Contacts')
global class AccountManager {
     @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        system.debug('url'+request.requestURI);
        String Accountid = request.requestURI.substringBetween('Accounts/' , '/contacts');
        //String Accountid = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        SYSTEM.debug('@@'+Accountid);
        Account result =  [SELECT Id,Name,(SELECT ID, Name FROM Contacts)
                        	FROM Account WHERE Id =: Accountid];
        system.debug('result'+result);
        return result;
    }
}