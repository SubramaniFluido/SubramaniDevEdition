trigger OrderEventTrigger on Order_Event__e (after insert) {
	// List to hold all cases to be created.
	system.debug('Hi I am outside');
    List<Task> taskList = new List<Task>();
    // Iterate through each notification.
    Integer counter = 0;
    for (Order_Event__e event : Trigger.New) {
        counter++;
        if (counter > 50) {
            system.debug('Hi I am inside trigger.new loop');
            if (event.Has_Shipped__c == true) {
                // Create Case to dispatch new team.
                Task tsk = new Task();
                tsk.Priority = 'Medium';
                tsk.Subject = 'Follow up on shipped order ' +
                    event.Order_Number__c;
                tsk.OwnerId = event.CreatedById;
                taskList.add(tsk);
            }
            break;
        }
        insert taskList;
        EventBus.TriggerContext.currentContext().setResumeCheckpoint(
          event.ReplayId);
   }
    // Insert all tasks corresponding to events received.
}