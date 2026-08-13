@isTest
public class Contact_assgTest {
    
    @TestSetup
    static void makeData(){
        List<Contact> conList = new List<Contact>(); 
        for (Integer i = 0; i < 100; i++) { 
            Contact con = new Contact();  
            con.LastName = 'Doe ' + i; 
            if(i<=50){
                con.Department = 'Soft Innovas'; 
            }
            else{
                con.Department = 'SI Salesforce';
            } 
            conList.add(con); 
        }  
        insert conList;
    }
    
    @isTest static void insertContacts(){

        List<Contact> conListBeforeInsert = [SELECT id FROM Contact];
        System.assertEquals(100, conListBeforeInsert.size());
        Test.startTest();
        Contact_assg.contactInsert();
        Test.stopTest();
        List<Contact> conList = [SELECT id, Department FROM Contact where Department= 'Soft Innovas'];
        System.assertEquals(56, conList.size());
        for (Contact con : conList) {
            System.assertEquals('Soft Innovas', con.Department);
        }
    }
    @isTest static void updateContacts(){ 

        Test.startTest();
        Contact_assg.contactUpdate();
        Test.stopTest();

        List<Contact> conList = [SELECT id, LastName, Department FROM Contact where Department= 'SI Salesforce'];

        System.assertEquals(100, conList.size());
        for (Contact con : conList) {
            System.assertEquals('SI Salesforce', con.Department);
        }    
    }

    @isTest static void deleteContacts(){

        Test.startTest();
        Contact_assg.contactDelete();
        Test.stopTest();

        List<Contact> conList = [SELECT id, LastName, IsDeleted, Department FROM Contact where Department= 'SI Salesforce'];

        System.assertEquals(0, conList.size());

        for (Contact con : conList) {
            System.assertEquals(true, con.IsDeleted);
        }      
    }

}