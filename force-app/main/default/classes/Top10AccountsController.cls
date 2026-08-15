public with sharing class Top10AccountsController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTop10Accounts() {
        return [
            SELECT Id, Name, Industry, AnnualRevenue, Phone
            FROM Account
            ORDER BY AnnualRevenue DESC NULLS LAST
            LIMIT 10
        ];
    }
}
