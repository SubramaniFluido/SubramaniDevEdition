({
	doFormSubmit : function(component, event, helper) {
        
        var carTypeIds = event.getParam("carTypeId");
		
        var carSearch= component.find("carSearchResultc");
        
        var carSearchResult= carSearch.searchCars(carTypeIds);
        
	}
})