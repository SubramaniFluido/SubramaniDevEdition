trigger AccountDeletion on Account (before delete) {
    
    for(Account a: [SELECT ID FROM Account Where ID IN (SELECT AccountId FROM Opportunity) AND ID IN: Trigger.Old]){
        Trigger.OldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }

}