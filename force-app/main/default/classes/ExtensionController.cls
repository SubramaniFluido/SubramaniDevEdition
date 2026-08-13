public class ExtensionController {
    
    private final Account acct;
    
    
    public ExtensionController(ApexPages.StandardController stdController) {
            this.acct = (Account)stdController.getRecord();
        }
        
        public String getAccDetails() {
            return 'Hello '+UserInfo.getFirstName()+' '+UserInfo.getLastName()+', Welcome to '+ acct.name +' Edit page';
        }
}