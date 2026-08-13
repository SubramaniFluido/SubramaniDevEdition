public with sharing class lwcClass {

    @AuraEnabled
    public static List<Account> getAccountList(){
        try {
            return [SELECT ID, Name, AnnualRevenue FROM Account LIMIT 20]; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}