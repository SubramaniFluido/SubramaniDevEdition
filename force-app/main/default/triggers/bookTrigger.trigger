trigger bookTrigger on Book__c (before insert, before update) {
    for(Book__c bk : Trigger.New){
        bk.Price__c *= 0.9;
    }
}