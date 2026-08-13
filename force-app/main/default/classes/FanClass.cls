Public class FanClass {
    public static String studentName='Harika';
    
    public final String STUDENT_NAME= 'Harika';

    public static void turnOnFan(){
        
        studentName='Ram';
        
            String code;
        if(code =='Press down'){
            system.debug('Turn on the fan');
        }
        else if(code== 'Press up'){
            system.debug('Turn off the fan');
        }
        else {
            system.debug('this is else loop');
        }
    }
    
    public static void collectionDemo(){
        String workingDay= 'Monday';
        List<String> weekdaysLst= new List<String>();
        weekdaysLst.add('Monday');
        system.debug('List weekdaysLst1 '+weekdaysLst);
            weekdaysLst.add('Monday');
       	system.debug('List weekdaysLst2 '+weekdaysLst);
		system.debug('Print 0 position '+weekdaysLst[0]);
        
        Map<Integer,String> mapdemo= new Map<Integer,String>();
        mapdemo.put(1, 'Monday');
        mapdemo.put(2, 'Tuesday');
        system.debug('Print map '+mapdemo);
        mapdemo.put(1, 'Wednesday');
        system.debug('Print map '+mapdemo.get(2));
        

        
        
        
    }
}