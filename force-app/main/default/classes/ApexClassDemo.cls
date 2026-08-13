/* Created by: Subramani Kumarasamy
 * Date: 23/02/2020
 * Purpose: To explain apex class structure
 * Test class: TBC
 * Related classes: TBC
 */
// Class name should be PascalCase
public class ApexClassDemo {
    
    //Important: Variable and Method Name should be camelCase. Consant should be upper case, words are separated by underscore
    //Class variable
    Public String stringVariable='String Variable from vs code';
    // Static variable
    Public static Integer staticVariable= 0;
    // Constant
    Public final String CONSTANT_VARIABLE= 'Constant Variable';  
    
    Public static String staticMethod(){
        String methodVariable= 'Static Method Variable';
        return methodVariable;
    }
    
    //Blank constructor
    Public ApexClassDemo(){
        System.debug('Static block');       
    }
    
    // Parameterized constructor is to get input from the user.
    Public ApexClassDemo(String userInput){
        this.stringVariable= userInput;
        System.debug('Static block');       
    }
    
    static{
        // This is to declare any static variables
        System.debug('Static block');
    }
    
    //INITIALIZATION BLOCK
    {
        // This is to initialize any variable value
        System.debug('Static block');
    }
    
    Public string nonStaticMethod(){
        stringVariable= 'Class Variable is modified by method';
        String nonStaticMethodVar= 'Non Static Method Variable';
        return nonStaticMethodVar;
    }
    
    Public static Integer classVariable(){
        //Non static variable cant be accessed by static method.
        //stringVariable= 'Class Variable is modified by method';
        staticVariable= 1;
        //Constant variable can't be changed once assigned.
        //CONSTANT_VARIABLE= 'Constant Variable is modified by method';
        return staticVariable;
    }
    Public Class  innerClass{
        Public String name;
        Public Integer employeeId;
        Public String dob;
        Public Integer mobileNumber;
        Public String major;
        
        public innerClass(String name, Integer employeeId, String dob, Integer mobileNumber, String major){
            //this keyword is used to refer the class variable as the name of class variable and constructor parameter name are same.
            this.name= name;
            this.employeeId= employeeId;
            this.dob= dob;
            this.mobileNumber= mobileNumber;
            this.major= major;
        }
        
    }

}