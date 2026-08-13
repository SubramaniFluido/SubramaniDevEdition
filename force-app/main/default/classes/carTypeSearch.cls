public class carTypeSearch {
    @AuraEnabled
    Public static List<Car_Type__c> getCarType(){
        return [Select id, Name FROM Car_Type__c];
    }

}