trigger expenseTrigger on Expense__c (before update) {
    List<Expense__c> exlist = new List<Expense__c>();
    for(Expense__c ex: Trigger.New){
      //  Expense__c ec = new Expense__c();
       // ec.Id = ex.Id;
        ex.Client__c= 'Trigger client';
      //  exlist.add(ec);
     // update ex;
    }
  //  delete exlist;
}