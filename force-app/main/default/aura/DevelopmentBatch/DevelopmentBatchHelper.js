({
	helperMethod : function(component, event, helper) {
		      var options = component.find("paid").get("v.checked");
        		alert(options);
        

        var action = component.get("c.Method1");
        
        // Add callback behavior for when response is received
        var message;
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
              message= response.getReturnValue();
                alert('message'+message);
            }
            else {
                alert("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
	},
    helperMethod1 : function(component, event, helper){
    alert('he');
	}
    
    
})