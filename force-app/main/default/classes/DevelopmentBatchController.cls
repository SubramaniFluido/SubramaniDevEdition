public class DevelopmentBatchController {
    
    @AuraEnabled
    public static String Method1(){
        String message='Apex server';
        
        return message;
    }


}