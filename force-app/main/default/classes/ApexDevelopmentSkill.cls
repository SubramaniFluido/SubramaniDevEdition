public class ApexDevelopmentSkill {
    
    public static void doWhileDemo(){
        Integer start=0;
        List<String> numberLst= new List<String>();
        do{
            if(Math.mod(start,3)==0 && Math.mod(start,5)==0){
                numberLst.add('fizzbuzz');
            }
            else if(Math.mod(start,3)==0){
                numberLst.add('fizz');
            }
            else if(Math.mod(start, 5)==0){
                numberLst.add('buzz');
            }
            else{
                numberLst.add(String.valueOf(start));
            }
            start++;
        }
        while(start<100);
        system.debug(start);
        system.debug(numberLst);
    }
    
    public static void whileDemo(){
        Integer start=1600;
        while(start<=2000){
            if(Math.mod(start, 4)==0){
                if(Math.mod(start, 100)==0){
                    if(Math.mod(start, 400)==0){
                        system.debug('Leap Year '+start);
                    }
                    else{
                        system.debug('Not a Leap Year '+start);
                    }
                }
                else{
                    system.debug('Leap Year '+start);
                }
            }
            else{
                system.debug('Not a Leap Year '+start);
        	}
            start++;
        }
    }
    
    public static void fibonacciSeries(){
        //0
        //1
        //0+1 =1
        //1+1= 2
        //1+2= 3
        //2+3= 5
        //3+5= 8
        Integer start=1;
        Integer firstNum=0;
        Integer secondNum=1;
        Integer resultNum=0;
        while(start<=20){
            if(start==1){
                system.debug(firstNum);
                system.debug(secondNum);
            }
            else{
                system.debug(resultNum);
            }            
            resultNum= firstNum+secondNum;
            firstNum=secondNum;
            secondNum=resultNum;
            start++;
        }
    }
    public static void patterForm(){
        Integer n=5;
        for(Integer row=0; row<n;row++){
            String pattern=' ';
            for(Integer col=0;col<=row;col++){
                pattern+= '* ';
            }
            system.debug(pattern);
        }
    }
    
    public static void breakStatement(){
        Integer n=1000;
        for(Integer i=1;i<=n;i++){
            system.debug('Printing '+i+ ' times');
            if(i==4){
                break;
            }
        }
    }   
    private static void privateMethod(){
        system.debug('private method');
    }
    
    public static void callPrivateMethod(){
        privateMethod();
    }
}