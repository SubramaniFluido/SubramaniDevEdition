public class AccountLookupHandler {
    Public static boolean staticVar = false;
    public static List<id> beforeMethod(List<Account_Lookup__c> accList){
        List<id> acNewList = new List<id>();
        system.debug('inside before method');
        for(Account_Lookup__c ac: accList){
            acNewList.add(ac.id);
        }
        system.debug('inside before method'+acNewList.size());
        
        return acNewList;
        //beforeMethod1();
    }
    
    @future(callout=true)
    public static void beforeMethod1(List<id> acNewList){
           beforeFutureMethod(acNewList);
    }
    
    public static void beforeFutureMethod(List<Id> accList1){
        system.debug('Before future method called'+accList1.size());
        for(Integer i=0;i<101;i++){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // Set the body as a JSON object
            request.setBody('{"name":"mighty moose"}');
            HttpResponse response = http.send(request);
            // Parse the JSON response
            if (response.getStatusCode() != 201) {
                System.debug('The status code returned was not expected: ' +
                             response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
            }
        }
    }
}