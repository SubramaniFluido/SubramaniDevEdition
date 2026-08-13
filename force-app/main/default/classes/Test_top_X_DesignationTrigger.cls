@istest
public class Test_top_X_DesignationTrigger {
	
    @istest static void method1(){
        Opportunity opp = new Opportunity();
			opp.Name= 'test opp';
			opp.StageName= 'Needs Analysis';
			opp.CloseDate= system.today();
        insert opp;
        Top_X_Designation__c top = new Top_X_Designation__c();
            top.Opportunity__c = opp.Id;
        	top.Type__c= 'Handoff';
        	top.Document_Attached__c= true;
        insert top;
    }
    @istest static void method2(){
        Opportunity opp = new Opportunity();
			opp.Name= 'test opp';
			opp.StageName= 'Needs Analysis';
			opp.CloseDate= system.today();
        insert opp;
        Top_X_Designation__c top = new Top_X_Designation__c();
            top.Opportunity__c = opp.Id;
        	top.Type__c= 'Handoff';
        	top.Document_Attached__c= false;
        insert top;
    }
    @istest static void method3(){
        Opportunity opp = new Opportunity();
			opp.Name= 'test opp';
			opp.StageName= 'Needs Analysis';
			opp.CloseDate= system.today();
        insert opp;
        Top_X_Designation__c top = new Top_X_Designation__c();
            top.Opportunity__c = opp.Id;
        	top.Type__c= 'Handoff';
        	top.Document_Attached__c= false;
        insert top;
        delete top;
    }
    
}