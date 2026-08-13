/**
 * ApexClassLifeCycle Class
 * To understant the Life Cycle of Apex Class
 * */
public class ApexClassLifeCycle {
    
    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;

	// initialization block 1
    {
        System.debug('Initilization Block 1 is Called');
    }

    // initialization block 2
    {
        System.debug('Initilization Block 2 is Called');
    }

    // static initialization block 1
    static {
        System.debug('Static Initilization Block 1 is Called');
    }

    // static initialization block 2
    static {
        System.debug('Static Initilization Block 2 is Called');
    }

    // blank constructor
    public ApexClassLifeCycle(){
        System.debug('Blank Constructor is called');
    }

    // parameterized constructor to set class variables value
    public ApexClassLifeCycle(Integer recoveredInArea){
        // calling blank constructor
        this();
        System.debug('Parameterized Constructor is called');
    }

    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }

    public static void printTreated(){
        System.debug('Recovered in country : '+recoveredInCountry);
    }

}