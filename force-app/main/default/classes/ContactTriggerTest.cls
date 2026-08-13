@isTest
public class ContactTriggerTest {
    @isTest
    static void setup(){
       Account acc =new Account();
        acc.Name= 'Test';
        acc.Email__c='test@gmail.com';
        insert acc;
        
        Contact con = new Contact();
        con.lastName= 'testName';
        insert con;        
    }

}