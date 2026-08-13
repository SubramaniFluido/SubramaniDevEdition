({
	doInit : function(component, event, helper) {
        helper.helperMethod(component, event, helper);
        
   	 	var createRecordEvent = $A.get("e.force:createRecord");
        if(createRecordEvent)
           component.set("v.showNew", true);
        else
           component.set("v.showNew", false); 
       	   console.log('Event is not supported');
	},
    
    newValueSelected : function(component, event, helper) {
   		var searchForm= component.getEvent("carSearchFormSubmit"); 
        var car= component.find("carTypeId").get("v.value");
        searchForm.setParams({
            "carTypeId" : car
        });
        searchForm.fire();
	},
    
    createRecord : function (component, event,  helper) {
    var createAcountContactEvent = $A.get("e.force:createRecord");
	createAcountContactEvent.setParams({
    "entityApiName": "car_Type__C"
	});
	createAcountContactEvent.fire();
    }  
})