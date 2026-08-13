public class AccountVisual {

    public String Phone{get;set;}
    public String Name{get;set;}

    public AccountVisual(ApexPages.StandardController controller) {

    }
    public void save(){
    Account acc = new Account();
    acc.Phone = Phone;
    acc.Name = Name;
    if (acc.Phone == null || acc.Phone == ''){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Phone Number'));
     }
    if (acc.Phone != null && acc.Phone != ''){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully'));
        insert acc;
   }
}
}