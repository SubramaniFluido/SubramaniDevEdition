trigger AccountLookup on Account_Lookup__c (before insert, before update, after update, after insert) {
    
    List<id> acNewList = new List<id>();
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate )){
        system.debug('inside trigger');
        acNewList= AccountLookupHandler.beforeMethod(Trigger.New);
        system.debug('inside trigger after method call');
        AccountLookupHandler.beforeMethod1(acNewList);
    }
    /*if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate )){
        List<Id> acList = new List<Id>();
        system.debug('outside for loop after trigger');
        for(Account_Lookup__c ac: Trigger.New){
            acList.add(ac.Id);
        }
        system.debug('last for loop after trigger'+acList.size());
       // AccountLookupHandler.afterMethod(acList);
    }*/
    
}