public class OppHandler {
    
    public static Boolean checkStageChange(String oldStage, String NewStage){
        Boolean checkBoolean = false;
        List<String> StageNameLst= new List<String>();
        Schema.DescribeFieldResult fieldResult = Opportunity.stageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple){
            StageNameLst.add(f.getValue());
        }
        Integer OldpickListPosition;
        Integer NewpickListPosition;
        for(Integer i=0; i<StageNameLst.size();i++){
            if(StageNameLst[i]==oldStage){
                OldpickListPosition= i;
            }
            if(StageNameLst[i]==NewStage){
                NewpickListPosition= i;
            }
        }
        if(OldpickListPosition!=NewpickListPosition-1){
            checkBoolean= true;
        }        
        return checkBoolean;    
    }

}