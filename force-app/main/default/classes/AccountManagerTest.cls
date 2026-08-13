@IsTest
public class AccountManagerTest {
    @isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://subramani-kumarasamy-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }
	// Helper method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
            Name='Test record'
            );
        insert accTest;
        Contact conTest = new Contact(
            LastName= 'LastName Con',
        	AccountId= accTest.id);
        insert conTest;
        return accTest.Id;
    }
}