trigger AccountTrigger on Account (before insert, before update, before delete) {
    
    
    /*List<String> NameList = new List<String>();
    Map<String,Account> duplicateAccMap = new Map<String,Account>();
    for(Account acc : trigger.New){
        if(!String.isBlank(acc.Name)){
            NameList.add(acc.Name);
        }
    }
    for(Account acc : [SELECT Name from Account where Name IN: NameList]){
        if(!String.isBlank(acc.Name)){
            duplicateAccMap.put(acc.Name, acc);
        }
    }
    for(Account instance : trigger.new){
        if(duplicateAccMap.containsKey(instance.Name)){
         //   instance.addError('Duplicate account found'+ duplicateAccMap.get(instance.name).Id);
        }
    } */
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        
        for(Account acc: Trigger.New){
            if(String.isBlank(acc.Description)){
                acc.Description= 'this is a defualt value from before trigger';
            }
            
        }
    }
    if (Trigger.isBefore && Trigger.isdelete){
        for(Account acc: Trigger.Old){
             Integer oppCount = [SELECT count() FROM opportunity where AccountId =: acc.Id];
            if(oppCount>0){
                acc.AddError('YOU CANNOT DELETE THIS ACCOUNT');
            }
        }
        
        
        system.debug('Hey I am in before Update');
    }
        //AccountTriggerHandler.CreateAccounts(Trigger.New);
}