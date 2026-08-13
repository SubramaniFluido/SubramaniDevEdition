({
    helperMethod : function(component, event, helper) {
        var contact= component.get("v.contact");
        var action = component.get("c.saveContact");
        action.setParams({
            con: contact
        })
        action.setCallback(this, function(response){
            if (response.getState() === "SUCCESS"){
                var showToastEvent = $A.get("e.force:showToast");
                if (showToastEvent){
                    showToastEvent.setParams({
                        "title" : "Saved",
                        "message" : "The record has been saved.",
                        "type" : "success" 
                    });
                    showToastEvent.fire();
                    component.set("v.contact",{'sObjectType':'Contact', 'FirstName':'', 'LastName':'','MobilePhone':'','Birthdate':'','Email':'',});
                } 
                else {
                    alert(params.Message);
                }
                var appEvent = $A.get("e.c:LightningInputAppEvent");
                appEvent.setParams({
                    "con" : contact
                });
                appEvent.fire();
            }
            else{
                var showToastEvent = $A.get("e.force:showToast");
                if (showToastEvent){
                    showToastEvent.setParams({
                        "title" : "Warning",
                        "message" : "Please Fill all the fields",
                        "type" : "Warning" 
                    });
                    showToastEvent.fire();
                }
            }
        })
        $A.enqueueAction(action);
    },     
})