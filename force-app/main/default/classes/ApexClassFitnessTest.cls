@isTest
public class ApexClassFitnessTest {
    
    public testMethod static void calculateBMITestPositive(){
        Decimal result = ApexClassFitness.calculateBMI(80, 1.2);
        system.debug('reuslt '+result);
    }
    public testMethod static void calculatePacePositive(){
        Decimal result= ApexClassFitness.calculatePace(1000, 150);
        system.debug('reuslt '+result);
    }

}