trigger AccountTrigger2 on Account (before insert, before update, after update){
    
    //, before update, before delete, after insert, after update, after delete, after undelete
    system.debug('This is account before insert');
}