trigger OppTrigger on Opportunity (After Insert, after Update, before insert) {
    if(trigger.isAfter && (trigger.isInsert || trigger.IsUpdate)){
	 	OpportunityTriggerHandler.afterInsertUpdate(Trigger.new);
    }
    if(Trigger.isBefore && trigger.isInsert){
        
        
    }
}