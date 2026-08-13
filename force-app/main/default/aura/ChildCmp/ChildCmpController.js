({
	handleClick : function(component, event, helper) {
        var compEvent = component.getEvent("sampleComponentEvent");
        
        var myValue= component.get("v.myText");
        compEvent.setParams({"message" : myValue });
        compEvent.fire();
	},
    callChildMethod : function(component, event, helper) {
        var params = event.getParam('arguments');
        alert(JSON.stringify(params));
    }
})