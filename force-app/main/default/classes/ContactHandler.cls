public with sharing class ContactHandler {
    public ContactHandler() {

    }

    public static void beforeInsertContactHandler(){

    }

    public static void beforeUpdateContactHandler(){
        
    }

    public static void beforeDeleteContactHandler(){
        
    }

    public static void afterInsertContactHandler(List<Contact> newContactList){
        List<Id> accountId= new List<Id>();
        Map<Id, List<Contact>> accIdConLstMap= new Map<Id, List<Contact>>();
        for(Contact con: newContactList){
            /*if(con.AccountId!=null & con.Active__c){
                accountId.add(con.AccountId);
            }*/
            if(con.FirstName!= null & con.LastName!=null){
                System.enqueueJob(new QueueableClass(con.FirstName,con.LastName));
            }
        }
        /*for(Contact con: [SELECT AccountId FROM contact WHERE Active__c=True AND AccountId IN: accountId]){
            if(!accIdConLstMap.ContainsKey(con.AccountId)){
                accIdConLstMap.put(con.AccountId, new List<Contact>{con});
            }
            else{
                accIdConLstMap.get(con.AccountId).add(con);
            } 
        }*/
        if(!accIdConLstMap.isEmpty()){
            updateAccount(accIdConLstMap);
        }
    }

    public static void afterUpdateContactHandler(List<Contact> newContactList, Map<Id, Contact> oldContactMap){
        List<Id> accountId= new List<Id>();
        Map<Id, List<Contact>> accIdConLstMap= new Map<Id, List<Contact>>();
        for(Contact con: newContactList){
            /*if(con.AccountId!=null & con.Active__c!= oldContactMap.get(con.Id).Active__c){
                accountId.add(con.AccountId);
            }*/
        }
        /*for(Contact con: [SELECT AccountId FROM contact WHERE Active__c=True AND AccountId IN: accountId]){
            if(!accIdConLstMap.ContainsKey(con.AccountId)){
                accIdConLstMap.put(con.AccountId, new List<Contact>{con});
            }
            else{
                accIdConLstMap.get(con.AccountId).add(con);
            } 
        }*/
        if(!accIdConLstMap.isEmpty()){
            updateAccount(accIdConLstMap);
        }
    }

    public static void afterDeleteContactHandler(List<Contact> OldContactList){
        List<Id> accountId= new List<Id>();
        Map<Id, List<Contact>> accIdConLstMap= new Map<Id, List<Contact>>();
        for(Contact con: OldContactList){
            /*if(con.AccountId!=null & con.Active__c){
                accountId.add(con.AccountId);
            }*/
        }
        /*for(Contact con: [SELECT AccountId FROM contact WHERE Active__c=True AND AccountId IN: accountId]){
            if(!accIdConLstMap.ContainsKey(con.AccountId)){
                accIdConLstMap.put(con.AccountId, new List<Contact>{con});
            }
            else{
                accIdConLstMap.get(con.AccountId).add(con);
            } 
        }*/
        if(!accIdConLstMap.isEmpty()){
            updateAccount(accIdConLstMap);
        }
    }

    public static void afterUnDeleteContactHandler(List<Contact> newContactList){
        List<Id> accountId= new List<Id>();
        Map<Id, List<Contact>> accIdConLstMap= new Map<Id, List<Contact>>();
        for(Contact con: newContactList){
            /*if(con.AccountId!=null & con.Active__c){
                accountId.add(con.AccountId);
            }*/
        }
        /*for(Contact con: [SELECT AccountId FROM contact WHERE Active__c=True AND AccountId IN: accountId]){
            if(!accIdConLstMap.ContainsKey(con.AccountId)){
                accIdConLstMap.put(con.AccountId, new List<Contact>{con});
            }
            else{
                accIdConLstMap.get(con.AccountId).add(con);
            } 
        }*/
        if(!accIdConLstMap.isEmpty()){
            updateAccount(accIdConLstMap);
        }
    }

    public static void updateAccount(Map<Id, List<Contact>>conCountMap ){
        List<Account> accList= new List<Account>();
        for(Id accountId: conCountMap.keySet()){
            Account acc= new Account();
            acc.id=accountId;
            acc.Number_of_Active_Contacts__c= conCountMap.get(accountId).Size();
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }

    }

}