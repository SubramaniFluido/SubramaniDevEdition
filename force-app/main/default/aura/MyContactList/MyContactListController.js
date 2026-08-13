({
	myAction : function(component, event, helper) {
        var action = component.get("c.getContacts");
            action.setParams({
                accId: component.get("v.recordId")
            })
			action.setCallback(this, function(data) {
			component.set("v.Contacts", data.getReturnValue());
            component.set("v.Columns", [
                {label:"Name", fieldName:"Name", type:"text"},
    			{label:"First Name", fieldName:"FirstName", type:"text"},
    			{label:"Last Name", fieldName:"LastName", type:"text"},
    			{label:"Phone", fieldName:"Phone", type:"phone"}
			]);

		});
	$A.enqueueAction(action);
	}
})