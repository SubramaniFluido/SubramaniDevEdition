public class OnlineTraining {
    
    Public static Account AccountInsert(String accName, String accType){
        
        Account acc= new Account();
        acc.Name = accName;
        acc.Type= accType;
        insert acc;
        return acc;
       
    }
}