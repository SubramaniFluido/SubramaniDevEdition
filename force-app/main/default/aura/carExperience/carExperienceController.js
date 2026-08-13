({
    doInit : function(component, event, helper) {
        helper.onInit(component, event, helper);
    },
    
    onUserInfoClick : function(component, event, helper) {
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