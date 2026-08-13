@istest
public with sharing class DeleteClosedLostOppsBatchTest {
    public static String CRON_EXP = '0 0 15 1/1 * ? *';
    @TestSetup
    static void makeData(){
        List<Opportunity> listOpp = new List<Opportunity>();
        for(integer i = 0 ; i< 200 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp' + i;
            opp.CloseDate = Date.today();
            opp.StageName = 'Closed Lost';
            listOpp.add(opp);
        }
        insert listOpp;
    }
   /*  @istest
   public static void testMethodBatch() {

        Test.starttest();
        DeleteClosedLostOppsBatch dcl = new DeleteClosedLostOppsBatch();
        Database.executeBatch(dcl, 200);
        Test.stopTest();

        List<Opportunity> listCheckOpp = [SELECT id FROM Opportunity];
        System.assertEquals(0, listCheckOpp.size());
    } */

    @istest
    public static void testMethodSchedule() {
        
        Test.startTest();
        DeleteClosedLostOppsBatchSchedulable dcs = new DeleteClosedLostOppsBatchSchedulable();
        System.schedule('Schedule From Apex', CRON_EXP, dcs);
        Database.executeBatch(new DeleteClosedLostOppsBatch(), 200);
        Test.stopTest();

        List<Opportunity> listCheckOpp = [SELECT id FROM Opportunity];
        System.assertEquals(0, listCheckOpp.size());
        
    }
}