({
    helperMethod : function(component, event, helper) {
        let gameModeCombox= component.find("gameMode");
        let selectedValue= gameModeCombox.get("v.value");
        console.log('Inside start game '+ selectedValue);
        component.set('v.selectedMode', selectedValue);
        let selectedMode= component.get("v.selectedMode");
        if(selectedMode){
            let childCmp = component.find("childComponent");
            childCmp.StartGame();
        }
    }
})