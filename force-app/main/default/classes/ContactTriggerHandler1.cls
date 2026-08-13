public class ContactTriggerHandler1 {
    
    public static void afterInsertMethodHandler(List<Contact> newContactLst){
        List<Contact> conWithAcc = new List<Contact>();
        List<Account> AccForCon = new List<Account>();
            for(Contact con: newContactLst){
                if(String.isBlank(con.AccountId)){
                    Account acc = new Account();
                    acc.Name= con.LastName;
                    acc.Required__c= con.Id;
                    AccForCon.add(acc);
                }
                insert AccForCon;
            }
        
        AggregateResult[] groupedResults= [SELECT MAX(Amount)aver FROM Opportunity];
        
			Object avgAmount = groupedResults[0].get('aver');
        system.debug('avgAmount'+avgAmount);

        for(Account acc: AccForCon){
            Id conId= Id.valueOf(acc.Required__c);
            Contact con = new Contact();
            con.Id= conId;
            con.AccountId= acc.Id;
            conWithAcc.add(con);
        }
        update conWithAcc;
    }
}