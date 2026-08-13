({
	handleClick : function(component, event, helper) {
        var input= component.get("v.myText");
        var appEvent = $A.get("e.c:appEvent");
        appEvent.setParams({
            "message" : input });
        appEvent.fire();
		
	}
  
})