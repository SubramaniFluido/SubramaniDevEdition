public class AutoLeadConvertBatch implements Database.Batchable<sObject>, Schedulable {
    Public LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    public Database.QueryLocator start(Database.BatchableContext bc) {
        system.debug('Batch Start Method');
        return Database.getQueryLocator('SELECT ID,Matched_Account__r.OwnerId FROM LEAD WHERE isconverted= FALSE AND Matched_Account__c!= null ORDER BY Createddate');
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        system.debug('Batch Execute Method');
        List<Lead> contacts = new List<Lead>();
        list<Database.LeadConvert> leadConverts = new list<Database.LeadConvert>();
        for (Lead ld : scope) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(ld.Id);
            lc.setConvertedStatus(convertStatus.MasterLabel);
            lc.setAccountId(ld.Matched_Account__c);
            lc.setDoNotCreateOpportunity(true);
            lc.setOwnerId(ld.Matched_Account__r.OwnerId);
            lc.setSendNotificationEmail(true);
            leadConverts.add(lc);
        }
        if(!leadConverts.isEmpty()){
            system.debug('leadConverts call');
            Database.LeadConvertResult[] lcrList = Database.convertLead(leadConverts, False);
            for(Database.LeadConvertResult lcr : lcrList){
                if(!lcr.isSuccess()){
                    for (Database.Error e : lcr.getErrors()) {
                      System.debug('Failed to convert lead Exception:' + e.getMessage());
                    }
                }
            }    
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Batch Finish Method');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        system.debug('No. of Errors: '+job.NumberOfErrors+ ' Job Processed '+job.JobItemsProcessed +' TotalJobItems '+job.TotalJobItems);
        
        AutoLeadConvertBatch apextoSchd = New AutoLeadConvertBatch();
        AsyncJobs_Frequency_Lookup__mdt asyncMeta=CustomMetadataUtility.getAsyncJobsMetaInfo('AutoLeadConvertBatch');
        Integer batchInterval = asyncMeta!=null ? Integer.valueOf(asyncMeta.Cron_Interval__c): 2; // Need to change this value
        Datetime nxtRun = system.now().addMinutes(batchInterval);
        Integer batchSize = asyncMeta!=null ? Integer.valueOf(asyncMeta.Batch_Size__c) :200;
        String cronvalue = 0+' '+string.valueof(nxtRun.minute())+' '+string.valueof(nxtRun.hour())+' '+string.valueof(nxtRun.day())+' '+string.valueof(nxtRun.month())+' ? '+string.valueof(nxtRun.year()) ; 
        String jobName = 'AutoLeadConvertBatch '+nxtRun.format('kk:mm');
        if(!test.isRunningTest()){
        	system.scheduleBatch(apextoSchd, jobName, batchInterval,batchSize);
        }
    }
    public void execute(SchedulableContext ctx) {
    }
}