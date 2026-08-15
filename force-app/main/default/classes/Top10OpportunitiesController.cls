public with sharing class Top10OpportunitiesController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getTop10Opportunities() {
        return [
            SELECT Id, Name, Amount, StageName, CloseDate, Account.Name
            FROM Opportunity
            WHERE Amount != NULL
            ORDER BY Amount DESC
            LIMIT 20
        ];
    }
}
