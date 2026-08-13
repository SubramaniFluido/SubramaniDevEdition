public class LightningInputController {
    
    @AuraEnabled
    public static Contact saveContact(Contact con) {
        system.debug('con'+con);
        Contact conInstance = new Contact();
        conInstance.FirstName= con.FirstName;
        conInstance.LastName= con.LastName;
        conInstance.MobilePhone= con.MobilePhone;
        conInstance.Birthdate= con.Birthdate;
        conInstance.Email= con.Email;
        insert conInstance;
        system.debug('coninsert'+conInstance);
        return conInstance;
    }
    
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id, Name, Email, Birthdate, MobilePhone FROM Contact ORDER BY Createddate DESC LIMIT 10];
        return conList;
    }
    
    @AuraEnabled 
    public static User fetchUser(){
       User u = [select id,Name,Email from User where id =: userInfo.getUserId()];
        return u;
    }
    
    @AuraEnabled
    public static Contact getContact() {
        Contact con = [SELECT Id, FirstName, LastName, Email, Birthdate, MobilePhone FROM Contact WHERE ID='0036F00003Un3MvQAJ'];
        return con;
    }
    
    @AuraEnabled
    public static Contact updateContact(Contact con) {
        system.debug('con'+con);
        Contact conInstance = new Contact();
        conInstance.id=con.id;
        conInstance.FirstName= con.FirstName;
        conInstance.LastName= con.LastName;
        conInstance.MobilePhone= con.MobilePhone;
        conInstance.Birthdate= con.Birthdate;
        conInstance.Email= con.Email;
        update conInstance;
        system.debug('coninsert'+conInstance);
        return conInstance;
    }

}