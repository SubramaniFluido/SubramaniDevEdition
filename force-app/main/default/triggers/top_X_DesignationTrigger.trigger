trigger top_X_DesignationTrigger on Top_X_Designation__c (after insert, after update, after delete) {
    Map <id,Id> topOppMaptrue = new Map<Id,Id>();
    Map <id,Id> topOppMapfalse = new Map<Id,Id>();
    Map <id,Id> topOppMapdelete = new Map<Id,Id>();
    Set<Id> oppId = new Set<Id>();
    List<Opportunity> oppList = new List<Opportunity>();
    for(Top_X_Designation__c top : trigger.isDelete ? trigger.Old : trigger.New){
        if(trigger.isInsert || trigger.isUpdate){
            if((top.Type__c== 'Handoff' || top.Type__c== 'Contract Flow Down') && top.Document_Attached__c== true){
                topOppMaptrue.put(top.Opportunity__c, top.id);
                oppId.add(top.Opportunity__c);
            }
            else{
                topOppMapfalse.put(top.Opportunity__c, top.id);
                oppId.add(top.Opportunity__c);
            }
        }
        else if(trigger.isDelete){
            topOppMapdelete.put(top.Opportunity__c, top.id);
            system.debug('hehe'+topOppMapdelete);
            oppId.add(top.Opportunity__c);
        }
    }
    for(Opportunity opp : [SELECT Handoff_Attached__c FROM opportunity where id IN : oppId]){
        if(topOppMaptrue.containsKey(opp.id)){
            opp.Handoff_Attached__c= 'Yes';
        }
        if(topOppMapfalse.containsKey(opp.id)){
            opp.Handoff_Attached__c= 'No';
        }
        if(topOppMapdelete.containsKey(opp.id)){
            opp.Handoff_Attached__c= 'No';
        }
        oppList.add(opp);
    }
    if(!oppList.isEmpty()){
        Database.update(oppList,false);
    }
}