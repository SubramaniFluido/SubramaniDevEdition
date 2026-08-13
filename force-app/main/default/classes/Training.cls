public class Training {
            
	public List<Contact> getContacts() {
    
    List<Contact> results = [SELECT Id, FirstName,LastName, Email , Title FROM Contact];
    return results;
	}

}