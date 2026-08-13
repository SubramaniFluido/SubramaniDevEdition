trigger AddRelatedRecord on Account(after insert, before insert) {
     List<Opportunity> oppList = new List<Opportunity>();
    if(Trigger.isAfter){    
    // Get the related opportunities for the accounts in this trigger
        Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.
    for(Account a : Trigger.New) {
       System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' +acctsWithOpps.get(a.Id).Opportunities.size());
        // Check if the account already has a related opportunity.
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0 ) {
            // If it doesn't, add a default opportunity
            oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       Discount_Percent__c=12,
                                       AccountId=a.Id));
        }           
 
    if (oppList.size() > 0) {
        insert oppList;
    }
    }   
    for(Opportunity opp:oppList ){
    Integer recordCount= trigger.New.size();
    List<String> email = new List<String>{'sangavee.t@tcs.com','subramani.1@tcs.com','aswathi.sridharan@tcs.com','e.niranjan@tcs.com'};
        EmailManager.sendMail(email, opp.name, recordCount+'Test Body');
        
    }
}
}