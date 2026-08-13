@RestResource(urlMapping='/v1/IntegrationApexWebservice/*')
global with sharing class IntegrationApexWebservice {

    // Get result
    @httpGet
    global static AccountWrapper getAccountDetails() {
        RestRequest req = RestContext.request;
        String requestURI= req.requestURI;
        String accountId = requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account accountRecord = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        List<Contact> conList= [SELECT Id, Name, Email FROM CONTACT Where AccountId= : accountId];
        List<Case> casList= [SELECT CaseNumber, Subject FROM CASE WHERE AccountId=: accountId];
        AccountWrapper wrapper= new AccountWrapper();
        wrapper.accountRecord= accountRecord;
        wrapper.contactList=conList;
        wrapper.caseList=casList;
        return wrapper;    
    }

    // Insert single record, uncomment and test
    /*@httpPost
    global static Account welcomePost(String accName, String accNumber, String industry, String description) {
        Account acc= new Account();
        acc.Name= accName;
        acc.AccountNumber= accNumber;
        acc.Industry= industry;
        acc.Description= description;
        insert acc;
        return acc;
    } */

    // Insert multiple object with multiple fields
    @httpPost
    global static AccountInformation welcomePost(AccountInformation information) {
        Account acc= information.accountRecord;
        insert acc;
        Contact con= information.contactRecord;
        con.AccountId= acc.Id;
        insert con;
        return information;
    }

    // Won't Support paramters
    @httpDelete
    global static String deleteAccount() {
        RestRequest req = RestContext.request;
        String requestURI= req.requestURI;
        String accountId = requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> accountList = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        if(!accountList.isEmpty()){
            try{
                delete accountList;
                return 'Account Deleted'; 
            }
            catch(System.exception ex){
                return ex.getMessage();
            } 
        }
        else{
            return 'No Account Found';
        }
    }

    // Patch result
    @httpPatch
    global static ResponseWrapper updateAccount(String accName, String accNumber, String industry, String description) {
        RestRequest req = RestContext.request;
        String requestURI= req.requestURI;
        String accountId = requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc= new Account();
        acc.Id= accountId;
        acc.Name= accName;
        acc.AccountNumber= accNumber;
        acc.Industry= industry;
        acc.Description= description;
        ResponseWrapper wrapper= new ResponseWrapper();
        try{
            update acc;
            wrapper.accountRecord= acc;
            wrapper.response= 'Account is updated';
            return wrapper;
        }
        catch(System.exception ex){
            wrapper.response= 'Exception: '+ex.getMessage();
            return wrapper;
        }  
    }

    global class AccountWrapper {
        global Account accountRecord;
        global List<Contact> contactList;
        global List<Case> caseList;
    }
    
    global class ResponseWrapper {
        global Account accountRecord;
        global String response;
    }

    global class AccountInformation {
        global Account accountRecord {get;set;}
        global Contact contactRecord {get;set;}
    }
}