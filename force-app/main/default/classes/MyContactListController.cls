public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts(Id accId) {
        SYSTEM.debug('@@'+accId);
        return [Select Id, Name, Email, Title, Phone From Contact where AccountId=: accId];
    }
    
}