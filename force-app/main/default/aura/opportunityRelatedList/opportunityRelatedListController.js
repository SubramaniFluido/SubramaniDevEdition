({
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.oppor", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})