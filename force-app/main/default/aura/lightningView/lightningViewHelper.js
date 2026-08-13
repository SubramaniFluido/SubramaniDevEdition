({
        fetchContacts : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var contactList = response.getReturnValue();
                component.set("v.contactList",contactList);
                component.set("v.sizeOfList",contactList.length);
            }
            else {
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
        }    
})