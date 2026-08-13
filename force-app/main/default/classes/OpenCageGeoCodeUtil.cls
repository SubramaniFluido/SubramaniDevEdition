public with sharing class OpenCageGeoCodeUtil {

    public static void forwardGeoCoding(Id recordId) {

        String endPoint= System.Label.OpenCageGeoEndPoint;
        String apiKey= System.Label.OpenCageGeoAPI;
        String errorMessage= '';

        Account accRec = [Select Id, Name, Location__latitude__s , Location__longitude__s ,ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity From Account Where Id =:recordId];
        
        String address = accRec.ShippingStreet+','+accRec.ShippingCity+','+accRec.ShippingState+','+accRec.ShippingPostalCode+','+accRec.ShippingCountry;
        String encodedString = EncodingUtil.urlEncode(address, 'UTF-8');
        String finalEndPoint= endPoint+'q='+encodedString+'&key='+apiKey+'&pretty=1';
        Http http = new Http();
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(finalEndPoint);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response= new HttpResponse();

        try{
            response= http.send(request);
            if(response.getStatusCode()==200){
                String body= response.getBody();
                OpenCageGeoCodeResponse openCage= (OpenCageGeoCodeResponse)System.JSON.deserialize(body, OpenCageGeoCodeResponse.class);
                List<OpenCageGeoCodeResponse.results> results = openCage.results;
                if(results!= null && results.size()>0){
                    OpenCageGeoCodeResponse.results result = results.get(0);
                    accRec.Location__latitude__s= result.geometry.lat;
                    accRec.Location__longitude__s= result.geometry.lng;
                    update accRec;
                    System.debug('Response Body '+result);
                }
            }else{
                errorMessage = 'Unexpected Error while communicating with OpenCage Data API. '
                    +'Status '+response.getStatus()+' and Status Code '+response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG, 'Exeception Executed '+errorMessage);
            }
        }
        catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
            }else{
                errorMessage = 'Unexpected Error while communicating with OpenCage Data API. '
                    +'Status '+response.getStatus()+' and Status Code '+response.getStatuscode();
            }
            System.debug(System.LoggingLevel.DEBUG, 'Exeception Executed '+errorMessage);
        } 
    }

    public static void reverseGeoCoding(Id recordId){
        String endPoint= System.Label.OpenCageGeoEndPoint;
        String apiKey= System.Label.OpenCageGeoAPI;
        String errorMessage= '';

        Account accRec = [Select Id, Name, Location__latitude__s , Location__longitude__s ,ShippingStreet, ShippingState, ShippingPostalCode, ShippingCountry, ShippingCity From Account Where Id =:recordId];
        
        String location = accRec.Location__latitude__s+'+'+accRec.Location__longitude__s;
        String encodedString = EncodingUtil.urlEncode(location, 'UTF-8');
        String finalEndPoint= endPoint+'q='+encodedString+'&key='+apiKey+'&pretty=1';
        Http http = new Http();
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(finalEndPoint);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response= new HttpResponse();

        try{
            response= http.send(request);
            if(response.getStatusCode()==200){
                String body= response.getBody();
                OpenCageGeoCodeResponse openCage= (OpenCageGeoCodeResponse)System.JSON.deserialize(body, OpenCageGeoCodeResponse.class);
                List<OpenCageGeoCodeResponse.results> results = openCage.results;
                if(results!= null && results.size()>0){
                    OpenCageGeoCodeResponse.results result= results.get(0);
                    accRec.ShippingStreet= result.components.road;
                    accRec.ShippingState= result.components.state;
                    accRec.ShippingCity= result.components.city;
                    accRec.ShippingPostalCode= result.components.postcode;
                    accRec.ShippingCountry= result.components.country;
                    Update accRec;
                    System.debug('Response Body '+result);
                }
            }else{
                errorMessage = 'Unexpected Error while communicating with OpenCage Data API. '
                    +'Status '+response.getStatus()+' and Status Code '+response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG, 'Exeception Executed '+errorMessage);
            }
        }
        catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
                    +' Remote Site Setting and add '+' '+ endPoint +' Endpoint';
            }else{
                errorMessage = 'Unexpected Error while communicating with OpenCage Data API. '
                    +'Status '+response.getStatus()+' and Status Code '+response.getStatuscode();
            }
            System.debug(System.LoggingLevel.DEBUG, 'Exeception Executed '+errorMessage);
        }
    }
}