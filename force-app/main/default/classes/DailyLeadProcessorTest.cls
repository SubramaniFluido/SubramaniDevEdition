@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<Lead> leadList = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead(
                LastName = 'Last ' + i,
                Company = 'TCS',
                Status  = 'Open - Not Contacted',
                CurrencyIsoCode = 'INR'
            );
            leadList.add(l);
        }
        insert leadList;
        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leadList);
        List<Id> leadId = new List<Id>(leadMap.keySet());
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        List<Lead> ld= [SELECT Id 
            FROM Lead 
            WHERE LeadSource= null];
        System.assertEquals(200, ld.size(), 'Lead with empty LedSource exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        ld = [SELECT Id 
            FROM Lead 
            WHERE LeadSource= 'Dreamforce'];
        System.assertEquals(leadList.size(), 
            ld.size(), 
            'Lead were not updated');
    }
}