public class ContactsListController {
    
    private String sortOrder = 'LastName';
    
	public List<Contact> getContacts() {
    
    List<Contact> results = Database.query(
        'SELECT Id, FirstName, LastName, Phone, Email ' +
        'FROM Contact ' +
        'ORDER BY ' + sortOrder + ' ASC ' +
        'LIMIT 10'
    );
    return results;
	}
    
    Public void sortByFirstName(){
        this.sortOrder ='FirstName';
    }
    
    Public void sortByLastName(){
        this.sortOrder='LastName';
    }

}