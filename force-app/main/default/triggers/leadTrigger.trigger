trigger leadTrigger on Lead (before update, after insert) {
    
    SWITCH ON Trigger.operationType{
        
        WHEN AFTER_INSERT{
            system.debug('Insert call in trigger');
            LeadTriggerHandler.afterInsertTriggerHandler(Trigger.new);
        }
        WHEN BEFORE_UPDATE{
            leadTriggerHandler.leadSource(Trigger.new, Trigger.OldMap);
        }
    }
}