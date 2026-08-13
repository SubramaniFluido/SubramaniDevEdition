public class FutureMethod {
    
    Public static void CreateContact(String LName, String UName){
        //Contact con = new Contact();
		//con.LastName= LName;
		//insert con;
        //CreateUser(con.LastName, UName);
        system.enqueueJob( new QueueableClass(LName,UName));
    }
    @future
    Public static void CreateUser(String LName, String UName){
        system.enqueueJob(new QueueableClass('hey','hey'));
        //UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        Profile p = [SELECT Id FROM Profile WHERE Name='Chatter Free User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName=LName, LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName=UName);
		insert u;
    }

}