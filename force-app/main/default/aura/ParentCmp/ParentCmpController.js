({
	handleComponentEvent : function(component, event, helper) {
        var message = event.getParam("message");
        component.set("v.parValue", message);
	},
    
    handleApplicationEvent : function(component, event, helper) {
        var message = event.getParam("message");
        component.set("v.parValue", message);
	},
    
    callAuraMethod : function(component, event, helper) {
        var childComponent = component.find("childCmp");
        var message = childComponent.childMethod();
	},
})