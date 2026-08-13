({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchUser");
        var ErrorMsg= 'Hello \r\n World';
        alert(ErrorMsg);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.userInfo", storeResponse);
                component.set("v.test", ErrorMsg);
            }
        });
       $A.enqueueAction(action);        
    },
    
    clickCreate : function(component, event, helper) {
        
        var lastNameId = component.find('lastName');
        var lastName = lastNameId.get("v.value");
        alert(lastName.length);
        if(lastName.length<5) {
            lastNameId.setCustomValidity("Please give valid last name");
			lastNameId.reportValidity();
        } else {
            helper.helperMethod(component, event, helper);
        }
    }, 
    
})