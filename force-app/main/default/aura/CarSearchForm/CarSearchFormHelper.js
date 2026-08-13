({
	helperMethod : function(component, event, helper) {   
        // Single line comment
        /* Para comment */
        helper.CallServer(component, "c.getCarType", function(response){
            component.set("v.carTypes", response)
        });
	}
})