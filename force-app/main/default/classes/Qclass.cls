public class Qclass implements Queueable {
    Public List<Contact> con;
    
    public Qclass(List<Contact> c){
        this.con= c;
        
    }
    
    Public void execute(QueueableContext Qc){
        List<User> usrList = new List<User>();
        system.debug('contact'+con.size());
        for(Contact cc: con){
            
        }
       // for(Contact con : triggerNewList){
            UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        	Profile p = [SELECT Id FROM Profile WHERE Name='Chatter Free User']; 
        	User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='LastName', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@yes6.com');
            usrList.add(u);
        //}
		insert usrList;
       	//system.enqueueJob(new Qclass2());
        
    }

}