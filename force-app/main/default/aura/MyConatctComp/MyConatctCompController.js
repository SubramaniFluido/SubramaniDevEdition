({
	getContactList : function(component, event, helper) {
        helper.fetchContact(component, event, helper);
	},
    newContact: function(component, event, helper) {
    var cont= $A.get("e.force:createRecord");
        cont.setParams({
            'entityApiName': 'Contact',
            'defaultFieldValues':{
                'AccountId': component.get("v.recordId")
            }
        });
        cont.fire();
	},
    editContact : function(component, event, helper) {
        var btn= event.getSource();
        var name= btn.get('v.name');
        var recordEditForm=component.find("recordEditForm");
        var recordViewForm=component.find("recordViewForm");
        if(name=='edit'){
            $A.util.addClass(recordViewForm,'formHide');
            $A.util.removeClass(recordEditForm,'formHide');
            btn.set('v.name', 'save');
            btn.set('v.label','Save');
        }
        else if (name=='save'){
            helper.saveContacts(component,event,helper);
        }
    },
    deleteContact : function(component, event, helper) {
        helper.removeContact(component, event, helper);
	},
    
})