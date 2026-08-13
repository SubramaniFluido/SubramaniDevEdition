public with sharing class showsuccesscontroller {

  public string accName{set;get;}
  Public String accPhone{set;get;}
   public void insertacc(){

try {  
   account acc=new account();
   acc.Name = accName;
   acc.Phone = accPhone;
        
   insert acc;  

 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully')); 
 PageReference pg = new PageReference('/001/o');
        pg.setRedirect(true);
 
} catch(DmlException e) {


 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Valid Data')); 
      

}
    }
  }