global Class ApexBatch implements Database.Batchable<sObject>, Schedulable, Database.stateful{
    global set<id> allIds=new set<id>();
    global set<id> succIds=new set<id>();
    global set<id> failIds=new set<id>();
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name FROM Account');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> acc){
        system.enqueueJob(new QueueableClass('hey','hey'));
        List<Account> acclist = new List<Account>();
        System.debug(acc.size());
        for(Account acnt : acc){
            if(String.IsNotBlank(acnt.Name)){
                acnt.Site= 'Site';
            	acclist.add(acnt);
            	allIds.add(acnt.id);
            }
        }
        if(!acclist.isEmpty()){
            Database.SaveResult[] srList= Database.update(acclist,false);
            // Iterate through each returned result
            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    succIds.add(sr.getId());
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Successfully inserted account. Account ID: ' + sr.getId());
                }
                else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                    }
                }
            }       
        }
    }        
    global void finish(Database.BatchableContext bc){
        for(Id ids :allIds){
            if(!succIds.contains(ids)){
                failIds.add(ids); 
            }
        }
        system.debug('Failed List'+failIds);
    }
    
    global void execute(SchedulableContext sc){
        Database.executeBatch(new ApexBatch()); 
    }
    
}