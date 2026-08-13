@isTest
public class TestRestrictContactByName  {
    
    static testMethod void restrictMethod1(){
       	Contact con = new Contact();
        con.LastName='INVALIDNAME';
        Database.insert(con,false);
    }

}