public class AccountUtils {
    public static List<Account> accountsByState(String state){
        List<Account> accList = [SELECT Id, Name FROM Account where  BillingState =: state ];
        return accList;
        }
}