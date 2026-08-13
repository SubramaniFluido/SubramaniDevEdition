@isTest 
public class AccountTriggerTest {
    
    
   @isTest static void createAccount(){
       
        List<Account> accList= new List<Account>();
        for(integer i=0; i<200; i++){
            Account acc = new Account();
            acc.Name = 	'Account'+i;
            acc.BillingState ='CA';
            accList.add(acc);
        }
       
        Test.startTest();
        insert accList;        
        Test.stopTest();  
       
        List<Account> accVerifyList = [SELECT BillingState FROM Account where ShippingState= 'CA'];
       	system.assertEquals(200, accVerifyList.size());
       
    }
    
    
}