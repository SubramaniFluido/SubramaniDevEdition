({
	onCarClick : function(component, event, helper) {
		var car= component.get("v.car");
        console.log("car buddy"+car.Id);
       	var compEvent= component.getEvent("carSelectRegEvent");
        compEvent.setParams({
            "carId" : car.Id 
        });
		compEvent.fire();
        //var car= component.get("v.selected");
       	
        var appEvent = $A.get("e.c:carSelectedApplicationEvent");
        if(appEvent){
            console.log("i am here"+car);
            appEvent.setParams({ 
                 "car" : car
            });
        }
        else{
            console.log("Application Event is not supported");
        }
        appEvent.fire();
	}
})