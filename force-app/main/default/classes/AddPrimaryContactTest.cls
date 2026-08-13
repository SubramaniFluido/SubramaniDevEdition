@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        //accounts.add(new Account(name='Parent'));
        // add 50 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState='NY'
            ));
        }
        // add 50 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState='CA'
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        String state ='CA';
        Contact con = new Contact(LastName = 'LastName');
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from Contact]);
    }
}