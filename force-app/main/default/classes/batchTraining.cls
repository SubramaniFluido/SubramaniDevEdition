global class batchTraining implements Database.Batchable<sObject> {

global Database.QueryLocator start(Database.BatchableContext BC) {

 String query = 'SELECT Id,Name FROM Contact';

 return Database.getQueryLocator(query);
 }
 
 global void execute(Database.BatchableContext BC, List<Contact> scope) {

 for(contact a : scope)
 {
 a.Phone = '+91-8428575275'; 
 } 
 update scope;
 } 
 
 global void finish(Database.BatchableContext BC) {
 
 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

//Below code will fetch the job Id

 AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];//get the job Id
 
System.debug('$$$ Jobid is'+BC.getJobId());
 
 //below code will send an email to User about the status

 String[] email = new String[]{'din2262@gmail.com'};

 mail.setToAddresses(email);

 mail.setReplyTo('din2262@gmail.com');//Add here your email address

 mail.setSenderDisplayName('Apex Batch Processing ');

 mail.setSubject('Batch Processing '+a.Status);

 mail.setPlainTextBody('The Batch Apex job processed '+a.TotalJobItems+'batches with '+a.NumberOfErrors+'failures'+'Job Item processed are'+a.JobItemsProcessed);
 
 Messaging.sendEmail(new Messaging.SingleEmailmessage [] {mail}); 
 }
}