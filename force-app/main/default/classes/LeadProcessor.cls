public class LeadProcessor implements Database.Batchable<sObject>, Database.stateful {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT ID, LeadSource ' +
            'FROM Lead ' 
         );
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadList = new List<Lead>();
        for(Lead ld: scope){
            ld.LeadSource = 'Dreamforce';
            leadList.add(ld);
        }
        update leadList;
    }
    
    public void finish(Database.BatchableContext bc){
        
        AsyncApexJob job = [SELECT Id, status From AsyncApexJob Where Id=:bc.getJobId()];
        System.debug('Subramani'+job.status);
    }

}