public class WrapperClsDemo {
    
    public static void method(){
        List<wrapperclass> wrlist = new List<wrapperclass>();
        wrapperclass wrobj = new wrapperclass('Kris', 12);
        wrlist.add(wrobj);
        wrapperclass wrobj1 = new wrapperclass('sau', 1);
        wrlist.add(wrobj1);
        system.debug('wraper lsit'+wrlist);
        for(wrapperclass ws: wrlist){
            system.debug('Student Name'+ws.stdName);
            
        }
    }
    
    
    
    public class wrapperclass{
        String stdName;
        Integer rank;
        public wrapperclass(String s, Integer i){
            this.stdName=s;
            this.rank=i;
        }
        
    }
    

}