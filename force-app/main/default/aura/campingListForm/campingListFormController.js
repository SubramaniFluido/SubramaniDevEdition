({
	 clickCreateItem: function(component, event, helper) {
        var validExpense = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newCamping = component.get("v.newItem");
            console.log("new item from form component"+newCamping);
            helper.createItem(component,newCamping);
        }
    }
})