({
    onInit : function(component, event, helper) {
        helper.CallServer(component, "c.getCarExperience",
                          function(response){
                              if(response){
                                  component.set("v.carExperiences", response)
                              }
                              else{
                                  console.log("error getting car Experience");
                              }
                          },
                          {
                              carId : component.get("v.car").Id
                          });
    },
})