public class QueueableClass implements Queueable {
    Public String UserLN;
    Public String UserN;
    
    Public QueueableClass(String LName, String UName){
        this.UserLN= LName;
        this.UserN= UName;
    }
    public void execute(QueueableContext Qc){
        system.debug('contact'+UserLN);
        System.enqueueJob(new QueueableClass('hey','hey') );
    }
}