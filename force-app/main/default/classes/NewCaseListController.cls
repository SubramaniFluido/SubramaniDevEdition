public class NewCaseListController {
    
    public List<Case> getNewCases(){
        List<Case> cas =[SELECT Id, CaseNumber, Status FROM Case WHERE Status='New'];
    return cas;
    }

}