({
    onInit: function(component, event, helper) {
        component.find("expRecordCreator").getNewRecord(
            "Car_Experience__c", // sObject type (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.simpleNewExp");
                var error = component.get("v.newExpError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec);
                    component.set("v.simpleNewExp.Car__c ", component.get("v.car").Id);
                }
            })
        );
    }
})