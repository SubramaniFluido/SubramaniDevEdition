public class AccountTrigger1Handler {
    
    public static void beforeTriggerHandler(List<Account> newAccList){
        Set<String> accName = new Set<String>();
        for(Account acc: newAccList){
            if(String.isNotBlank(acc.Name)){
                accName.add(acc.Name);
            }
        }
        List<Account> accList= [SELECT Id, Name FROM  Account WHERE Name IN: accName];
        for(Account acc: newAccList){
            if(accList.size()>0){
                acc.addError('This is a Duplicate Account. Please change Name and Save');
            }
        }
    }      
    
}