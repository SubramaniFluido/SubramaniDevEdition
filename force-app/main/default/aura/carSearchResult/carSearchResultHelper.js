({
	onSearch : function(component, event, helper) {
        helper.CallServer(component, "c.getCars",function(response){
            if(response.length >0){
            	component.set("v.carFound",true);
            	component.set("v.cars", response);
            }
        else{
            component.set("v.carFound",false);
        }
        },{
            carTypeId : component.get("v.carTypeId")
        });
                         
                          
	}
})