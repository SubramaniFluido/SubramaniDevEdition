public with sharing class Top10ContactsController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getTop10Contacts() {
        return [
            SELECT Id, FirstName, LastName, Email, Phone, AccountId, Account.Name
            FROM Contact
            ORDER BY CreatedDate DESC
            LIMIT 10
        ];
    }
}
