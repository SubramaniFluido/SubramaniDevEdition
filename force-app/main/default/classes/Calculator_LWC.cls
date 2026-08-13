/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 05-12-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class Calculator_LWC {
    
    @AuraEnabled
    public static Decimal calculateImperative(Integer a, Integer b,String operation){
        Integer result = 0;
        if(operation.equals('Add')){
            result = a+b;
        }
        if(operation.equals('Sub')){
            result = a-b;
        }
        if(operation.equals('Multiply')){
            result = a * b;
        }
        if(operation.equals('Divide')){
            result = a / b;
        }
        System.debug('Result  '+result);
        return result;
    }

}