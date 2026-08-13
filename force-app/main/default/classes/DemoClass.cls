public class DemoClass{
    
    public static void fizzBuzzLogic(){
        for(Integer i=1;i<100;i++){		
            if(math.mod(i, 5)==0 && math.mod(i, 3)==0){
                system.debug('FizzBuzz');
            }
            else if(math.mod(i, 3)==0){
                system.debug('Fizz');
            }
            else if(math.mod(i, 5)==0){
                system.debug('Buzz');
            }
            else{
                system.debug(i);
            }
        }
    }
}