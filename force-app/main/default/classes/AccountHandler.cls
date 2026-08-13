public class AccountHandler {
    
    Public static Account insertNewAccount(String AccountName){
        
        Account act = new Account();
        act.Name= AccountName;
        act.Amount__c=567;
        try{
            insert act;
            return act;
        }
        catch(DmlException err){
            system.debug('Error cccured'+err.getMessage());
            return null;
        }        
    }
}