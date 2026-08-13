Public class AccountControler{
    
    Public static string stringname;
    
    
    public List<Account> getAccounts(){
        List<Account> accList = [select id,Name,Rating,Type from Account Limit 10];
        return accList;
        
    } 

    public static void updateAvgCaseResolutionDays(List<Id> accountId){
        Map<Id, Integer> accIdTotalDayMap = new Map<Id, Integer>(); 
        Map<Id, Integer> accIdTotalCaseMap = new Map<Id, Integer>(); 
        // retrive all the cases for this account
        // get resolution days for each account (ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate,AccountId
                            FROM Case
                            WHERE IsClosed=true
                                AND AccountId IN: accountId]){
            if(accIdTotalDayMap.containsKey(caseObj.AccountId)){
                Integer totalCase=accIdTotalCaseMap.get(caseObj.AccountId);
                totalCase++;
                Integer totalDays;
                totalDays= accIdTotalDayMap.get(caseObj.AccountId) + caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
                accIdTotalDayMap.put(caseObj.AccountId, caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date()));
                accIdTotalCaseMap.put(caseObj.AccountId, totalCase);
            }else{
                Integer totalCase=0;
                totalCase++;
                accIdTotalDayMap.put(caseObj.AccountId, caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date()));
                accIdTotalCaseMap.put(caseObj.AccountId, totalCase);
            }
        }
        List<Account> accList= new List<Account>();
        for(Id accId: accIdTotalCaseMap.keySet()){
            Account acc= new Account();
            acc.Id= accId;
            acc.Avg_Case_Resolution_Days__c= accIdTotalDayMap.get(accId)/ accIdTotalCaseMap.get(accId);
            accList.add(acc);
        }
        update accList;
    }
    
}