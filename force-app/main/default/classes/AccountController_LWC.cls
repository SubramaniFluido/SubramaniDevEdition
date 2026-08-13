/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 05-11-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class AccountController_LWC {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getTenAccounts(){
        return [Select Id,Name,Type,Rating,AnnualRevenue from Account LIMIT 10];
    }
}