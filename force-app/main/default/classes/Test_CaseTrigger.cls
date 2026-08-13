@isTest
public class Test_CaseTrigger {
    
     static testMethod void caseInsert(){
    Case cse= new Case();
    cse.User_Email__c= 'test@gmail.com';
    cse.Origin='Phone';
	insert cse;
        
   Case cse1= new Case();
   cse1.User_Email__c= 'test1@gmail.com';
   cse1.Origin='Phone';
	insert cse1;
    
}
}