@IsTest
public class MyIterableTest {
    
    @isTest
    public static void testIterableForLoop(){
       	 List<String> strings = new List<String>{'Hello', 'World'};
         MyIterable iterable = new MyIterable(strings);
         for (String str : iterable) {
       		System.debug(str);
		}
           
        
    }

}