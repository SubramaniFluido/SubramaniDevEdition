public class CustomMetadataUtility {
   public static AsyncJobs_Frequency_Lookup__mdt getAsyncJobsMetaInfo(string developerName){
        AsyncJobs_Frequency_Lookup__mdt asyncMdt = [select Batch_Size__c,Cron_Interval__c,Cron_Threshold_Freq_1__c,
                                                    Cron_Threshold_Freq_2__c,Cron_Type__c,Monitor_Flag__c,ScheduleClassName__c
                                                    from AsyncJobs_Frequency_Lookup__mdt where MasterLabel=:developerName];
        if(asyncMdt != null){    
            system.debug('asyncMdt'+asyncMdt.Batch_Size__c);
            return asyncMdt;
        }
       else{
           return null;
       }      
   }
}