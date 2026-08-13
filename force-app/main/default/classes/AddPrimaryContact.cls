public class AddPrimaryContact implements Queueable {
    
    private Contact contacts;
    private String state;
    
    public AddPrimaryContact(Contact con, String st){
        this.contacts =con;
        this.state = st;
    }
    
    public void execute(QueueableContext context){
        List<Contact> conList = new List<Contact>();
        for(Account acc : [SELECT id,Name,BillingState FROM Account WHERE BillingState =: state Limit 200]){
            Contact clonedCon = contacts.clone(false, false, false, false);
            clonedCon.AccountId= acc.id;
           	conList.add(clonedCon);
        }
        insert conList;
    }

}