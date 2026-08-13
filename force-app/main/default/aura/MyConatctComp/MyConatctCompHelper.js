({
	fetchContact : function(component, event, helper) {
        var action = component.get("c.getContacts");
        var accountId = component.get("v.recordId");
        action.setParams({
            accountIds: accountId
        });
        action.setCallback(this,function(response){
           var state= response.getState();
        if(state==='SUCCESS'){
            var contactList= response.getReturnValue();
            console.log(contactList);
            component.set("v.contactList",contactList);
         }
        else
        {
            alert('Error in fetching data');
        }
            });
		$A.enqueueAction(action);
	},
    
    //fUNCTION TO UPDATE CONTACTS
    saveContacts : function(component, event, helper) {
        //getting viewform and editform
        var recordEditForm=component.find('recordEditForm');
        var recordViewForm=component.find('recordViewForm');
        //getting contact List
        var contactList= component.get('v.contactList');
        // initialize toast event
        var toastEvent= $A.get('e.force:showToast');
        // call savecontact function from apex
        var saveAction= component.get('c.saveContactList');
        var btn= event.getSource();
        //set paramaters to apex method
        saveAction.setParams({ contactLst: contactList});
        saveAction.setCallback(this,function(response){
           var state= response.getState();
            if(state==='SUCCESS'){
            var dataMap=response.getReturnValue();
        if(dataMap.status=='success'){
            $A.util.addClass(recordEditForm,'formHide');
            $A.util.removeClass(recordViewForm,'formHide');
            btn.set('v.label','Edit');
            btn.set('v.name','edit');
            toastEvent.setParams({
                'title': 'Success!',
                'type': 'success',
                'message':dataMap.message
            });
            toastEvent.fire();
        }
        else if(dataMap.status=='error'){
                toastEvent.setParams({
                    'title': 'Error!',
                	'type': 'error',
                	'mode': 'dismissable',
                	'message':dataMap.message
                });
                toastEvent.fire();
          }
            }
          else{
            alert('Error in fetching data');
        }
            
  });
$A.enqueueAction(saveAction);
},
    
    removeContact: function(component, event, helper) {
        // Getting the deleteContact Component
        var contactsToDelete = component.find("deleteContact");
        // Initialize an empty array
        var idsToDelete = [];
        // Checking if contactsToDelete is an array
        if(contactsToDelete.length!=undefined) {
            // Iterating the array to get contact ids
            for(var i=0;i<contactsToDelete.length;i++) {
                // If contact has delete checkbox checked, add contact id to list of ids to delete
                if(contactsToDelete[i].get("v.checked")) 
                    idsToDelete.push(contactsToDelete[i].get("v.value"));
            }            
        } else {
            // if contactsToDelete is not an array but single object, 
            // check if delete checkbox is checked and push id to list of ids to delete
            if(contactsToDelete.get("v.checked"))            
                idsToDelete.push(contactsToDelete.get("v.value"));            
        }
        // Initializing the toast event to show toast
        var toastEvent = $A.get('e.force:showToast');
        // Defining the action to delete contact List ( will call the deleteContactList apex controller )
        var deleteAction = component.get('c.deleteContactList');
        // setting the params to be passed to apex controller
        deleteAction.setParams({
            contactIds: idsToDelete
        });
        // callback action on getting the response from server
        deleteAction.setCallback(this, function(response) {
            // Getting the state from response
            var state = response.getState();
            if(state === 'SUCCESS') {
                // Getting the response from server
                var dataMap = response.getReturnValue();
                alert(dataMap.status);
                // Checking if the status is success
                if(dataMap.status=='success') {
                    // Setting the success toast which is dismissable ( vanish on timeout or on clicking X button )
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type': 'success',
                        'mode': 'dismissable',
                        'message': dataMap.message
                    });
                    // Fire success toast event ( Show toast )
                    toastEvent.fire();
                    window.location.reload();
                }
                // Checking if the status is error 
                else if(dataMap.status=='error') {
                    // Setting the error toast which is dismissable ( vanish on timeout or on clicking X button )
                    toastEvent.setParams({
                        'title': 'Error!',
                        'type': 'error',
                        'mode': 'dismissable',
                        'message': dataMap.message
                    });
                    // Fire error toast event ( Show toast )
                    toastEvent.fire();                
                }
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');
            }            
        });
        $A.enqueueAction(deleteAction);
    }
})