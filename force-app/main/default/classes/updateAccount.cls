public class updateAccount {
    
    public Account acc;
    
    public void updateAccount() {
        acc= new Account();
    }
    public Account getacc() {
        return acc;
    }
    public PageReference save() {
        insert acc;
        PageReference pref = new ApexPages.StandardController(acc).view();
        return pref;
    }
    
}