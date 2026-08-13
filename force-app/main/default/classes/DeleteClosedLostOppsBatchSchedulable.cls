public with sharing class DeleteClosedLostOppsBatchSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        DeleteClosedLostOppsBatch b = new DeleteClosedLostOppsBatch(); 
        database.executeBatch(b,200);
        System.debug('schedule last line');
    }
}