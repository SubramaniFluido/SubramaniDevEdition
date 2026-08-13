trigger OpportunityTrigger on Opportunity (before update) {
    Boolean checkStageNameChange;
    for(Opportunity opp: Trigger.New){
        Opportunity OldOpp= Trigger.OldMap.get(opp.Id);
        checkStageNameChange= OppHandler.checkStageChange(OldOpp.StageName, opp.StageName);
    }
    
}