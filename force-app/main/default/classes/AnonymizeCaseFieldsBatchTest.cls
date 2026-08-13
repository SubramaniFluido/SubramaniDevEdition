@isTest
public with sharing class AnonymizeCaseFieldsBatchTest {
   
    @TestSetup
    static void makeData(){

        List<Case> listCase = new List<Case>();
        for(integer i = 0 ; i< 100 ; i++){
            Case cs = new Case();
            Contact c = new Contact();
            cs.ContactId = c.Id;
            cs.AccountId = c.AccountId;
            cs.Origin ='Web';
            cs.Status ='Closed';
            cs.SuppliedCompany = 'random comp';
            cs.SuppliedEmail = 'random@string.com';
            cs.SuppliedName = 'rAndom String N '+ i;
            cs.SuppliedPhone = '55454';
            cs.ClosedDate = System.now().addYears(-2);
            cs.CreatedDate = System.now().addYears(-3);
            listCase.add(cs);
        }
        if(!listCase.isEmpty()){
            insert listCase;
        }
    }

    @isTest
    private static void testMethodBatch() {
     

        Test.starttest();
        AnonymizeCaseFieldsBatch dcl = new AnonymizeCaseFieldsBatch();
        Id batchId = Database.executeBatch(dcl);
        Test.stopTest();

        
        List<Case> listCheckCase = [SELECT id, ContactId, AccountId, SuppliedCompany, SuppliedEmail, SuppliedName, SuppliedPhone FROM Case ];
        System.assertEquals(listCheckCase.size(), 100); // 1 ????
 
    }

    @isTest
    private static void testMethodSchedule() {

        Test.starttest();
        AnonymizeCaseFieldsBatchScheduler dcs = new AnonymizeCaseFieldsBatchScheduler();
        string sch = '0 0 15 1/1 * ? *';
        System.schedule('Schedule Anonymize', sch, dcs);
        Test.stopTest();
    }

    @isTest
    private static void generateRandomStringTest(){
      String testStr =  AnonymizeCaseFieldsBatch.generateRandomString(10);
    }

    @isTest
    private static void generateRandomInteger(){
        String testInt = AnonymizeCaseFieldsBatch.generateRandomInteger();
    }
}