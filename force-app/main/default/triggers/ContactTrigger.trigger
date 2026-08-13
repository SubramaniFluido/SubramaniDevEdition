trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    SWITCH ON Trigger.operationType{

        WHEN BEFORE_INSERT{
            ContactHandler.beforeInsertContactHandler();
        }

        WHEN BEFORE_UPDATE{
            ContactHandler.beforeUpdateContactHandler();
        }

        WHEN BEFORE_DELETE{
            ContactHandler.beforeDeleteContactHandler();
        }
        
        WHEN AFTER_INSERT{
        List<TestEvent__e> eventlist= new List<TestEvent__e>();
            for(Contact con: Trigger.New){
            TestEvent__e eventins= new TestEvent__e();
            eventins.Account_Name__c= con.LastName;
            eventlist.add(eventins);
            }
                
             EventBus.publish(eventlist);
            //ContactHandler.afterInsertContactHandler(Trigger.new);
        }

        WHEN AFTER_UPDATE{
            //ContactHandler.afterUpdateContactHandler(Trigger.new, Trigger.oldMap);
        }

        WHEN AFTER_DELETE{
            ContactHandler.afterDeleteContactHandler(Trigger.old);
        }

        WHEN AFTER_UNDELETE{
            ContactHandler.afterUnDeleteContactHandler(Trigger.new);
        }
    }
}