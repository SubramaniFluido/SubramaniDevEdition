public class WrapperClassContrl {
    
    public List<WrapperClass> listWrapper {get;set;}
    
    
    public WrapperClassContrl() {
        List<Account> listAcct = [SELECT Name, Industry FROM Account LIMIT 1000];
        
        if(listAcct.size() > 0) {
            listWrapper = new List<WrapperClass>();
            for(Account a : listAcct) {
                listWrapper.add(new WrapperClass(a));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checkBool {get;set;}
        
        public Account acct {get;set;}
        
        public WrapperClass(Account acc) {
            this.acct = acc;
            this.checkBool = false;
        }        
    }
}