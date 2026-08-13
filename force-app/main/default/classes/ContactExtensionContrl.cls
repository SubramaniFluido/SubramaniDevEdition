public class ContactExtensionContrl{
    
    public List<Contact> contList {get;set;}
    
    public ContactExtensionContrl(AccountControler acs){
        contList = [select id,FirstName,LastName,Email from Contact Limit 10];
    }
    
}