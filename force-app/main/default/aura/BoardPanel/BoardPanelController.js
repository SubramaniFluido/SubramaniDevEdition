({
    startGame : function(component, event, helper) {
        helper.helperMethod(component, event, helper);

    },

    resuffleGame : function(component, event, helper) {
        helper.helperMethod(component, event, helper);
    },

    handleApplicationEvent: function(component, event, helper) {
        let result = event.getParam("result");
        if(result=== "win"){
            component.set("v.disableButton", true);
        }
        else if(result==="lost"){
            component.set("v.disableButton", false);
        }
    }
})