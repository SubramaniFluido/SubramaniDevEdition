public class AnimalLocator {
    public static String getAnimalNameById(Integer inte) {
        String returnType= NULL;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+inte);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> mapOfAnimals = (map<string,object>) results.get('animal');
            returnType = string.valueof(mapOfAnimals.get('name'));
            SYSTEM.debug('results'+results);
            system.debug('mapof Aaninmals'+mapOfAnimals);
            system.debug('returntype'+returnType);
        } else {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        	}
        return returnType;
    }
    
}