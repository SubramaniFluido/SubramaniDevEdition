@isTest
public class AccountProcessorTest {
    @isTest static void contTest(){
        
        Account acc = new Account();
        acc.Name= 'Test One';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName='FirstName';
        con.LastName='Test';
        con.AccountId=acc.id;
        insert con;
        
        List<Id> accID = new List<Id>();
        accID.add(acc.id);
        
        Test.startTest();
        AccountProcessor.countContacts(accID);
        Test.stopTest();
    }
}