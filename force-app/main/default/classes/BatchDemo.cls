public class BatchDemo implements Database.Batchable <Sobject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('SELECT Id from contact');
    }
   
    Public void execute(Database.BatchableContext bc, List<Account> sc){
        Database.getQueryLocator('SELECT Id from contact');
        
    }
	
    Public void finish(Database.BatchableContext bc){
        
    }
        
}