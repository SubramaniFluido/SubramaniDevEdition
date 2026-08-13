trigger AccountTrigger1 on Account (before delete, before update, after insert) {
    
    if(ActivateTrigger__c.getInstance().isActive__c){
        if((trigger.isBefore && trigger.isInsert) || (trigger.isUpdate && trigger.isBefore)){
            AccountTrigger1Handler.beforeTriggerHandler(Trigger.New);
        }
        if(trigger.isBefore && trigger.isDelete){
            //AccountTrigger1Handler.beforeDeleteTriggerHandler(Trigger.New);
        }
    }
    if(trigger.isAfter && trigger.isInsert){
        List<TestEvent__e> testEventList = new List<TestEvent__e>();
        for(Account a: Trigger.New){
            TestEvent__e testEvent = new TestEvent__e();
            testEvent.Account_Name__c= a.Name;
            testEventList.add(testEvent);
        }
        EventBus.publish(testEventList);
        

    }
    
}