public class caseTriggerHandler extends AbstractTriggerHandler {


   // Then all DML operations are evaluated and records are filtered
    public override void beforeInsert(Sobject newObj) {
       system.debug('This is inside beforeInsert');
    }
    

     // Then all DML operations are evaluated and records are filtered
     public override void afterInsert(Sobject newObj) {


    }


     // Then all DML operations are evaluated and records are filtered
     public override void afterUpdate(Sobject newObj, Sobject oldObj) {


    }

    // Then all DML operations are evaluated and records are filtered
    public override void afterDelete(Sobject oldObj) {


    }



     
// _____________________________________________________________________________________________
// Everything under this line happens after the filtering in the first part is done


    public override void postProcessBeforeInsert() {

    }

    public override void postProcessAfterInsert() {


    }

    public override void postProcessAfterUpdate() {

    }



    
}