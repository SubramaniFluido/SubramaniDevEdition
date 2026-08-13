public class leadTriggerHandler {
    
    public static void leadSource(List<Lead> triggerNewList,Map<Id,Lead> triggerOldMap){
        for(Lead ldInstance : triggerNewList){
            if(ldInstance.LeadSource != triggerOldMap.get(ldInstance.Id).LeadSource){
                ldInstance.IsLeadSourceChecked__c =true;
            }
        }
    }
    public static void afterInsertTriggerHandler(List<Lead> newLeadList){
        system.debug('afterInsertTriggerHandler Method call');
        Map<Id, Account> AccountIdAccountMap = new Map<Id, Account>();
        Set<Id> accIdSet = new Set<Id>();
        List<Lead> leadsToConvertList = new List<Lead>();
        for(Lead ld: newLeadList){
            if(ld.Matched_Account__c!= null){
                accIdSet.add(ld.Matched_Account__c);
                leadsToConvertList.add(ld);
            }
        }
        for(Account acc: [SELECT id, ownerId FROM Account where Id IN: accIdSet]){
            AccountIdAccountMap.put(acc.Id, acc);
        }
        if(!leadsToConvertList.isEmpty()){
            leadConversionMethod(leadsToConvertList, AccountIdAccountMap);
        }
    }
    public static void leadConversionMethod(List<Lead> leadsTobeConverted, Map<Id, Account> AccountIdAccountMap){
        system.debug('leadConversionMethod Method call');
        list<Database.LeadConvert> leadConverts = new list<Database.LeadConvert>();
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        for(Lead ld: leadsTobeConverted){
            system.debug('inside for loop '+AccountIdAccountMap.get(ld.Matched_Account__c).OwnerId);
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(ld.Id);
            lc.setConvertedStatus(convertStatus.MasterLabel);
            lc.setAccountId(ld.Matched_Account__c);
            lc.setDoNotCreateOpportunity(true);
            lc.setOwnerId(AccountIdAccountMap.get(ld.Matched_Account__c).OwnerId);
            lc.setSendNotificationEmail(true);
            leadConverts.add(lc);
        }
        if(!leadConverts.isEmpty()){
            system.debug('leadConverts call');
            Database.LeadConvertResult[] lcrList = Database.convertLead(leadConverts, False);
            for(Database.LeadConvertResult lcr : lcrList){
                system.debug('LeadConvertResult call');
                System.assert(lcr.isSuccess());
            }    
        }
    }
}