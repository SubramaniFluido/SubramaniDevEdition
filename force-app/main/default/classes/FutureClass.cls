public class FutureClass {
    
    Public static Contact CreateUser(){
        //non-setup object
        Contact con = new Contact();
		con.LastName= 'Test';
		insert con;
        
        //setup object
		UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        Profile p = [SELECT Id FROM Profile WHERE Name='Chatter Free User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName=con.LastName, LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, userroleid = r.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@yes2.com');
		insert u;
				
		return con;        
    }
}