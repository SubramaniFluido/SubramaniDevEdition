public class SoftDemo {
    
    public static void returnAccount(String accountName){
        List<Account> accList= new List<Account>();
        accList= [Select id,name,type from account where name =:accountName];
        for(Account acc:  accList){
    		System.debug('Account Name '+acc.Type);
		}
    }
    
    public static void relationshipQuery(){
        List<Account> accndConList= new List<Account>();
		accndConList= [Select id, name, (Select id,name from contacts) from account];
        for(Account acc: accndConList){
            System.debug('Account Name '+acc.Name);
            for(Contact con: acc.contacts){
                System.debug('Contact Name '+con.Name);
            }
        }
    }
    
    public static void soslquery(){
        List<List<sObject>> result = new List<List<sObject>>();
		result= [FIND 'test or subramani' IN ALL FIELDS RETURNING Account(Name, Type) , 
                 Contact(FirstName, LastName, Email, MobilePhone), Case(CaseNumber, Subject)];
		Account[] accresult= result[0];
        for(Account acc: accresult){
            System.debug('Account Name '+acc.Name);
        }
        Contact[] conResult = result[1];
        for(Contact con: conResult){
            System.debug('Contact Email '+con.Email);
        }
        Case[] caseResult = result[2];
        for(Case cs: caseResult){
            System.debug('CaseNumber '+cs.CaseNumber);
        }
    }
    
    public static void createContact(){
        List<Contact> conList= new List<Contact>();
        Account acc= [Select id, Name from account where name ='Subramani' LIMIT 1];
        for(Integer i=0; i<152;i++){
			Contact con = new Contact();
            con.FirstName= 'Demo';
            con.LastName= 'Contact '+i;
            con.AccountId= acc.Id;  
            conList.add(con);
        } 
        insert conList;  
    }
    
    // I need to
    public static void updateAccount(){
        
        List<Account> accList= [Select id, Name from account LIMIT 10];
        List<Account> updateAccList= new List<Account>();
        for(Account acc: accList){
            if(acc.Type=='Prospect'){
                acc.Name= 'Subramani Demo';
                updateAccList.add(acc);
            }            
        }
        if(!updateAccList.isEmpty())
        	update updateAccList;
    }
    
}