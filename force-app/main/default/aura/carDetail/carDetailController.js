({
	doInit : function(component, event, helper) {
        var carparent= component.get("v.car");
        console.log("carslect"+carparent);
        var createCarRecord = $A.get("e.force:navigateToSObject");
        if(createCarRecord){
            component.set("v.showCarAction", true);
        } else{
            component.set("v.showCarAction", false);
            console.log('Navigate event is not supported Here');
        }
	},
    
    onFullDetails : function(component, event, helper) {
		 var navEvt = $A.get("e.force:navigateToSObject");
        	if(navEvt){
    			navEvt.setParams({
     				 "recordId": component.get("v.car").Id ,
     				 "slideDevName": "detail"
   				});
  		 navEvt.fire(); 
            } 
        	else {
                console.log("e.force:navigateToSObject ebent is not supported in this context");
                helper.showToast(component, {
                                 "title" : "Error",
                                 "type"  : "error",
                                 "message": "Event is not supported"
                                 });
            }
	}
    
})