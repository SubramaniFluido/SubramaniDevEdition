/*
 *
 * Factory class for trigger handler implementations
 */
public class TriggerHandlerFactory {
    
    public static void createAndExecuteHandler(Type typ) {
    // Instantiate the type
    Object obj = typ.newInstance();
    if (!(obj instanceof TriggerHandlerInterface)) {
      throw new TriggerException(
        'No Trigger Handler found named: ' + typ.getName()
      );
    }

    executeHandler((TriggerHandlerInterface) obj);
  }

  private static void executeHandler(TriggerHandlerInterface handler) {
    if (Trigger.IsBefore) {
      handler.bulkBefore();

      if(Trigger.isInsert) {
        handler.bulkBeforeInsert();
        for (SObject sObj : Trigger.new) {
          handler.beforeInsert(sObj);
        }

        handler.postProcessBeforeInsert();
      }
      if (Trigger.isUpdate) {
        handler.bulkBeforeUpdate();
        for (SObject sObj : Trigger.new) {
          handler.beforeUpdate(sObj, Trigger.oldMap.get(sObj.Id));
        }

        handler.postProcessBeforeUpdate();
      }
      if (Trigger.isDelete) {
        for (SObject sObj : Trigger.old) {
          handler.beforeDelete(sObj);
        }
        handler.postProcessBeforeDelete();

      }
    } else {
      handler.bulkAfter();

      if (Trigger.isInsert) {
        handler.bulkAfterInsert();
        for (SObject sObj : Trigger.new) {
          handler.afterInsert(sObj);
        }
        handler.postProcessAfterInsert();
      }
      if (Trigger.isUpdate) {
          handler.bulkAfterUpdate();
        for (SObject sObj : Trigger.new) {
          handler.afterUpdate(sObj, Trigger.oldMap.get(sObj.Id));
        }
        handler.postProcessAfterUpdate();
      }
      if (Trigger.isDelete) {
        for (SObject sObj : Trigger.old) {
          handler.afterDelete(sObj);
        }
        handler.postProcessAfterDelete();
      }
    }

    handler.postProcess();
  }

  public class TriggerException extends Exception {
  }
}