({
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    handleAddItem: function(component, event, helper) {
        var item= event.getParam("item");
        console.log("get param"+item);
        var action = component.get("c.saveItem");
        action.setParams({
            "item": camping
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var item = component.get("v.items");
                item.push(response.getReturnValue());
                component.set("v.items", item);
                console.log("camping created");
            }
        });
        $A.enqueueAction(action);
    }   
})