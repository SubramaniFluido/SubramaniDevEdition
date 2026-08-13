public class StringArrayTest {
    
    public static List<String> generateStringArray( Integer num){
        List<String> intg = new List<String>();
        	for(Integer i=0;i<num;i++){
            intg.add('Test'+' '+i);
        	}
        system.debug('Sub'+intg);
        return intg;
    }
}