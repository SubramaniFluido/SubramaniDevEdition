public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accList){
        for(Account acc : accList){
            system.debug('Hello'+acc.Name);
            acc.name=UserInfo.getFirstName()+ ' '+ UserInfo.getLastName();
            acc.Required__c= UserInfo.getFirstName()+ ' '+ UserInfo.getLastName();
            system.debug('Hello'+acc.Required__c);
        }
    }
}