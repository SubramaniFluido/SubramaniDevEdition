global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx) {
        lIST<Lead> leadUpdate = new List<Lead>();
        List<Lead> leadList = [SELECT Id, Name, LeadSource  
            FROM Lead 
            WHERE LeadSource = Null  
            Limit 200];
        // Create a task for each opportunity in the list
        for(Lead ld : leadList){
            ld.LeadSource= 'Dreamforce';
            leadUpdate.add(ld);
        }
        if(!leadUpdate.isEmpty()){
            update leadUpdate;
        }
    }
}