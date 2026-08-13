public class OpportunityTriggerHandler {
    
    public static void afterInsertUpdate( List<Opportunity> oppNewList){
        List<Task> taskList = new List<Task>();
        for(Opportunity opp: oppNewList){
            if(opp.StageName=='Qualification'){
                Task tsk = new Task();
                tsk.Subject= 'Follow up on the new opportunity'; 
                tsk.WhoId= opp.Owner.Id;
                tsk.Status= 'Not Started';
                tsk.Priority= 'Normal';
                tsk.WhatId= opp.id;
                taskList.add(tsk);
            }
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    
}