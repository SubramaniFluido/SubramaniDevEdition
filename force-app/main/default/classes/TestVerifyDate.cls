@isTest
public class TestVerifyDate {
    @isTest static void testDate1(){
        VerifyDate.CheckDates(system.today(), system.today().addDays(10));
    }
    
     @isTest static void testDate2(){
        VerifyDate.CheckDates(system.today(), system.today().addMonths(2));
    }

}