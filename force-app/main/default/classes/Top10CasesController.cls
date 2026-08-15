public with sharing class Top10CasesController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getTop10Cases() {
        return [
            SELECT Id, CaseNumber, Subject, Status, Priority, CreatedDate
            FROM Case
            ORDER BY CreatedDate DESC
            LIMIT 10
        ];
    }
}
