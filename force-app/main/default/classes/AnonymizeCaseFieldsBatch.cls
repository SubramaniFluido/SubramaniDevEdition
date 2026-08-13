public with sharing class AnonymizeCaseFieldsBatch implements Database.Batchable<sObject> {
  
    public Database.QueryLocator start(Database.BatchableContext bc){ 
    return Database.getQueryLocator([SELECT Id,AccountId, ContactId, ClosedDate, SuppliedCompany, SuppliedEmail, SuppliedName, SuppliedPhone
                                        FROM Case 
                                        WHERE Status ='Closed'
                                        AND ClosedDate > LAST_N_YEARS:1]); 
}



public void execute(Database.BatchableContext bc, List<Case> scope){
    List<Case> caseList = new List<Case>();
    for(Case cs:scope){
      cs.AccountId = null;
      cs.ContactId = null;
      //cs.Description = cs.Account.Name + 'test'; 
      cs.SuppliedName = AnonymizeCaseFieldsBatch.generateRandomString(10);
      cs.SuppliedEmail = AnonymizeCaseFieldsBatch.generateRandomString(8) + '@' + AnonymizeCaseFieldsBatch.generateRandomString(8) + '.com';
      cs.SuppliedCompany = AnonymizeCaseFieldsBatch.generateRandomString(12);
      cs.SuppliedPhone = AnonymizeCaseFieldsBatch.generateRandomInteger();
    caseList.add(cs);
  }
  if(!caseList.isEmpty()){
        update caseList;
       } 
    

}

public void finish(Database.BatchableContext bc){

}


@TestVisible
private static String generateRandomString(Integer len) {
    final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    String randStr = '';
    while (randStr.length() < len) {
    Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
    randStr += chars.substring(idx, idx+1);
    }
    return randStr;
}

@TestVisible
private static string generateRandomInteger(){
        Integer len=10;
        final string chars = '0123456789';
        String randStr = '';

        while(randStr.length() <len){
            Integer idx =Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
          }

          return randStr;
    }

}