public class AccountProcessor {
    @future
    Public static void countContacts(List<Id> accId){
        List<Account> accList =new List<Account>();
        List<Contact> conList = new List<Contact>();
        Map<id, List<Contact>> accMap = new Map<id, List<Contact>>();
        for(Contact con : [Select id, Name, Accountid from contact where Accountid IN:accId]){
            if(accMap.containsKey(con.Accountid)){
                accMap.get(con.Accountid).add(con);
            }
            else{
                List<Contact> conList2 = new List<Contact>();
                conList.add(con);
                accMap.put(con.Accountid, conList2);
            }
            Integer i = accMap.get(con.Accountid).size();
        }
        
        for(Account acc: [SELECT Id, Number_of_Contacts__c, (SELECT Id, Name FROM Contacts) FROM Account where Id IN: accId]){
            conList.add(acc.Contacts);
            acc.Number_of_Contacts__c = conList.size();
            accList.add(acc);
        }
        update accList;
    } 

}