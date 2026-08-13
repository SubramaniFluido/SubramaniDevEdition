({
	
    getSavedCon : function(component, event, helper) {
        var contact = event.getParam("con");
        component.set("v.contact", contact);
    },
    
    clickUpdate : function(component, event, helper) {
        var contact= component.get("v.contact");
        alert(contact.Birthdate);
        var action = component.get("c.updateContact");
        action.setParams({
            con: contact
        })
        action.setCallback(this, function(response){
            if (response.getState() === "SUCCESS"){
                var showToastEvent = $A.get("e.force:showToast");
                if (showToastEvent){
                    showToastEvent.setParams({
                        "title" : "Saved",
                        "message" : "The record has been updated.",
                        "type" : "success" 
                    });
                    showToastEvent.fire();
                    component.set("v.contact",{'sObjectType':'Contact', 'FirstName':'', 'LastName':'','MobilePhone':'','Birthdate':'','Email':'',});
                } 
                else {
                    alert(params.Message);
                }
            }
        })
    }
    
})