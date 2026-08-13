public class opportunityRelatedList {
    
    @AuraEnabled
    public static List<Opportunity> findAll() {
        return [SELECT Id, Name, StageName, Amount, Probability FROM Opportunity LIMIT 50];
    }

}