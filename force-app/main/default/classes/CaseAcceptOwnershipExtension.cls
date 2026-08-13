public class CaseAcceptOwnershipExtension {
     PageReference cancel;
     Case[] cases;
     public CaseAcceptOwnershipExtension(ApexPages.StandardSetController ctrl) {
          cases = (Case[])ctrl.getSelected();
          cancel = ctrl.cancel();
     }
     public PageReference updateCases() {
          for(Case c : cases) {
               c.OwnerId = UserInfo.getUserId();
          }
          update cases;
          return cancel.setRedirect(true);
     }
}