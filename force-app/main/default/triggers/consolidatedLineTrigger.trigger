trigger consolidatedLineTrigger on Consolidated_Line__c (before insert) {
    Set<Id> invoiceIdSet = new Set<Id>();
    Map<Id, Invoice__c> inplajobMap = new Map<Id, Invoice__c>();
    Set<Id> invWithoutPacementSet = new Set<Id>();
    Map<Id, Fee__c> feeMap = new Map<Id, Fee__c>();
    Map<Id, Id> invInvItemMap = new Map<Id, Id>();
    for(Consolidated_Line__c conLn : Trigger.New){
        if(String.isNotBlank(conLn.Invoice__c)){
	            invoiceIdSet.add(conLn.Invoice__c);            
        }        
    }
    
    for(Invoice__c inv: [SELECT Id, Placement__c, Placement__r.job__r.Name, Placement__r.job__r.Job_Number__c  FROM Invoice__c WHERE ID IN: invoiceIdSet]){
        if(inv.Placement__c != Null){
            inplajobMap.put(inv.id, inv);
        }
        else{
            invWithoutPacementSet.add(inv.id);
        }
    }
    
    for(Invoice_Item__c initem: [SELECT Id, Invoice__c FROM Invoice_Item__c WHERE Invoice__c IN: invWithoutPacementSet LIMIT 1]){
           invInvItemMap.put(initem.Invoice__c, initem.id );
    }
    
    for(Fee__c fee: [SELECT Id, Job__c,Job__r.Job_Number__c,Job__r.Name,  Invoice_Item__c FROM Fee__c WHERE Invoice_Item__c IN: invInvItemMap.values() ]){
        feeMap.put(fee.Invoice_Item__c,fee );
    }
    
    for(Consolidated_Line__c con: Trigger.New){
        if(!inplajobMap.isEmpty()){
             con.Name= inplajobMap.get(con.Invoice__c).Placement__r.job__r.Name;
             con.Consolidated_Line_No__c = inplajobMap.get(con.Invoice__c).Placement__r.job__r.Job_Number__c;
        }
        else if(!invWithoutPacementSet.isEmpty()){
            con.Name= feeMap.get(invInvItemMap.get(con.Invoice__c)).Job__r.Name;
            con.Consolidated_Line_No__c = feeMap.get(invInvItemMap.get(con.Invoice__c)).Job__r.Job_Number__c;
        }
    }    
}