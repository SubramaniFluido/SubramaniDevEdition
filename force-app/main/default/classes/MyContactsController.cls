public class MyContactsController {
    @AuraEnabled
    Public static List<Contact> getContacts(List<Id> accountIds){
        List<Contact> contactList= [SELECT Id, FirstName, LastName, AccountId, Phone, Email FROM Contact WHERE AccountId IN:accountIds ];
        return contactList;
    }
    
    @AuraEnabled
    Public static Map<String,String> saveContactList(List<Contact> contactLst){
        Map<String, String> resultMap = new Map<String,String>();
        try{
            update contactLst;
            resultMap.put('status', 'success');
            resultMap.put('message','Contacts are updated successfully');
        }
        Catch(Exception e){
            resultMap.put('status','error');
            resultMap.put('message',e.getMessage());
        }
        return resultMap;
    }
    
    @AuraEnabled
    Public static Map<String,String> deleteContactList(List<Contact> contactIds){
        system.debug('##'+contactIds);
        List<Contact> contactsToDelete = [SELECT Id FROM Contact WHERE Id in :contactIds];
        system.debug('@@@'+contactsToDelete);
        Map<String, String> resultMap = new Map<String,String>();
        try{
            delete contactsToDelete;
            resultMap.put('status', 'success');
            resultMap.put('message','Contacts are deleted successfully');
        }
        Catch(Exception e){
            resultMap.put('status','error');
            resultMap.put('message',e.getMessage());
        }
        return resultMap;
    }
}