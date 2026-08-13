public class CampingListController {
    @AuraEnabled
    Public static List<Camping_Item__c> getItems(){
        return [SELECT Name, Quantity__c, Price__c, Packed__c, Id FROM Camping_Item__c];
    }
    
    @AuraEnabled
    Public static Camping_Item__c saveItem(Camping_Item__c item){
        insert item;
        return item;
    }
    

}