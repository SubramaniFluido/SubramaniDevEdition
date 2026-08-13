@isTest
public class LeadProcessorTest {
    @testsetup
    static void setup(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<100;i++){
            Lead ld = new Lead();
            ld.LastName='LastName'+i;
            ld.Company='Company'+i;
            ld.Status='Working - Contacted';
            leadList.add(ld);
        }
        insert leadList;
    }
    
    @isTest static void batchTest(){
        Test.startTest();
        LeadProcessor leadproce = new LeadProcessor();
		Database.executeBatch(leadproce);
        Test.stopTest();
    }
}