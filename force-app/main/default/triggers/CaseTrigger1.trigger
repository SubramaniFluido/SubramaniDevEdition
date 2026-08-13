trigger CaseTrigger1 on Case (before insert, before update) {
  //  if(Trigger.isBefore && (Trigger.isInsert ||Trigger.isUpdate)){
    Set<String> caseEmail= new Set<String>();
    set<String> caseEmailExist =  new Set<String>();
    List<case> caseDuplicateEmail = new List<case>();
    for (Case cse: Trigger.New){
        if (!String.isBlank(cse.User_Email__c)){
            caseEmail.add(cse.User_Email__c);
        }
    }
    System.debug('1st- Incoming Case Email'+caseEmail);
    caseDuplicateEmail= [SELECT id, User_Email__c FROM Case WHERE User_Email__c IN :caseEmail];
    for (Case cse: caseDuplicateEmail){
        caseEmailExist.add(cse.User_Email__c);
    }
    System.debug('2nd - Existing case which has same email id LIST'+caseDuplicateEmail);
    System.debug('3rd - Existing case which has same email id SET '+caseEmailExist);
    for(Case cse: Trigger.New){
        if(caseEmailExist.contains(cse.User_Email__c)){
            cse.addError('Record exist with same Email ID');
        }
    }
    }    
// }