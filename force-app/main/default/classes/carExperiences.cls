public class carExperiences {
    @AuraEnabled
    Public static List<Car_Experience__c> getCarExperience(Id carId){
        return [SELECT Id, Owner.name, Name, Car__r.name, Experience__c, 
                CreatedDate, 
                CreatedBy.Name, 
                CreatedBy.SmallPhotoUrl,
                CreatedBy.CompanyName
                FROM Car_Experience__c WHERE 
              	Car__c =:carId 
                ORDER BY Createddate DESC];
    }
}