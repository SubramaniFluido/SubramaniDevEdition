public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numbOfCont, String lastName){
        List<Contact> con = new List<Contact>();
        for(Integer i=0;i<numbOfCont;i++){
            Contact c = new Contact();
            c.FirstName= 'FirstName'+i;
            c.LastName= lastName;
            con.add(c);
        }
        return con;
    }
}