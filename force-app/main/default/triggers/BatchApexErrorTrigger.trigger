trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c> bceList = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent bt: Trigger.New){
        BatchLeadConvertErrors__c bce = new BatchLeadConvertErrors__c ();
        bce.AsyncApexJobId__c = bt.AsyncApexJobId;
        bce.Records__c = bt.JobScope;
        bce.StackTrace__c = bt.StackTrace;
        bceList.add(bce);
    }
    if(!bceList.isEmpty()){
        insert bceList;
    }

}