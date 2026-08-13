public class DemoLearn {
    
    public DemoLearn(){
        OnlineClass();
        Gym();
        Breakfast();
        carservice();
        movie();
    }
    
    public void OnlineClass(){
        system.debug('I will attend online class at 7am');
    }
    Public void Gym(){
        system.debug('I will go to gym at 8am');
    }
    Public void Breakfast(){
        system.debug('Breakfast at 9am');
    }
    @future
    Public static void carservice(){
        system.debug('carservice at 9:30am');
    }
    Public void movie(){
        system.debug('movie at 1:30am');
    }
}