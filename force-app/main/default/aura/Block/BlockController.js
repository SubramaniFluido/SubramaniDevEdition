({
    revealWord : function(component, event, helper) {
        component.set("v.open", true);
        let value= component.get("v.word");
        let compEvent = component.getEvent("onClickEvent");
        compEvent.setParams({"value" : value });
        compEvent.fire();
    },
    scriptsLoaded: function(component, event, helper) {
        const boardBlock= component.getElement(".board-block ");
        fitText(boardBlock);
    }
})