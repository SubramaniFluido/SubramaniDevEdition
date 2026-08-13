public class ContactSearch {
    
   public static List<Contact> searchForContacts(String lastName, String MailCode){
       List<Contact> conList = new List<Contact>();
       for( Contact con : [SELECT Id, Name FROM Contact WHERE LastName =:lastName AND 
                           MailingPostalCode=:MailCode]){
          conList.add(con);
       }
       return conList;
    }
}