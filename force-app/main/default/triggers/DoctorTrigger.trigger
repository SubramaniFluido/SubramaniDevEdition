trigger DoctorTrigger on Doctor__c (before insert, after update) {
    
    system.debug('This is Doctor Trigger insert Event');
    

}