public class carSearchcontroller {
    @AuraEnabled
    public static List<Car__c> getCars(String carTypeId){
        if(carTypeId!= null && carTypeId.equalsIgnoreCase('')){
            return [SELECT Id, Name, Picture__c, Contact__r.Name, GeLoaction__Longitude__s, GeLoaction__Latitude__s
                FROM Car__c WHERE Available_for_Rent__c= true];
        }
        else{
            return [SELECT Id, Name, Picture__c, Contact__r.Name, GeLoaction__Longitude__s, GeLoaction__Latitude__s 
                FROM Car__c WHERE Available_for_Rent__c= true AND Car_Type__c =: carTypeId];
        }
    }
}