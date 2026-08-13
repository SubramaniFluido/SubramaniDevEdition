public class SampleClass {
    
    public static void createAccConMap(){
        Map<Id,List<Contact>> accconMap= new Map<Id,List<Contact>>();
        for(Contact con: [Select AccountId, Name from contact where AccountId!=null limit 10]){
            if(accconMap.containsKey(con.AccountId)){
                accconMap.get(con.AccountId).add(con);
            }
            else{
                List<Contact> conList = new List<Contact>();
            	conList.add(con);
            	accconMap.put(con.AccountId,conList);
            }
        }
        system.system.debug('accconMap '+accconMap);
    }

}