({
	onCarSelected : function(component, event, helper) {
        var recordId = event.getParam("car").Id; 
        component.set("v.carId", recordId);
        component.find("service").reloadRecord(true);  
	},
    
    onCarExpAdded : function(component, event, helper) {
        component.set("v.tabId", "expTab");
       	component.find("expTabId").refresh;
	}
    
})