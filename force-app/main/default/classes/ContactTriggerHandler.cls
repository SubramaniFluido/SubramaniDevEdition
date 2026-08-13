public class ContactTriggerHandler {
    
    @future
    public static void beforeInsertMethodHandler(){
        
        //query from from dtaabase using id
        //iterate 
        List<User> usrList = new List<User>();
        
       // for(Contact con : triggerNewList){
            UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        	Profile p = [SELECT Id FROM Profile WHERE Name='Chatter Free User']; 
        	User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='LastName', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@yes4.com');
            usrList.add(u);
        //}
		insert usrList;
        system.debug('hahehe'+usrList);
        for( User usr: usrList){
            system.debug('hey hey'+usr.id);
        }
    }

}