public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212');
        insert a; 
        ID jobID = System.enqueueJob(new AsyncExecutionExample());
    	AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];
		system.debug('sub' +jobInfo);
    }
}