public with sharing class AnonymizeCaseFieldsBatchScheduler implements Schedulable {
    
    public void execute(SchedulableContext sc){
        Database.executeBatch(new AnonymizeCaseFieldsBatch());
    }
}