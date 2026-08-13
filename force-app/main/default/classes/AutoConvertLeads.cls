Public class AutoConvertLeads {     
   
    public static void LeadAssign(List<Lead> LeadIds){
        system.debug('Inside lead convert method');
        LeadStatus CLeadStatus= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true Limit 1];    
        List<Database.LeadConvert> MassLeadconvert = new List<Database.LeadConvert>();    
        for(Lead currentlead: LeadIds){ 
            Database.LeadConvert Leadconvert = new Database.LeadConvert();    
            Leadconvert.setLeadId(currentlead.Id);                               
            Leadconvert.setConvertedStatus(CLeadStatus.MasterLabel);             
            Leadconvert.setDoNotCreateOpportunity(TRUE); 
            Leadconvert.setAccountId(currentlead.Pipedrive_Organization__c);
            MassLeadconvert.add(Leadconvert);    
        }                  
        if(!MassLeadconvert.isEmpty()){ 
            system.debug('Inside MassLeadconvert');
            List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadconvert);       
        }    
    } 
}