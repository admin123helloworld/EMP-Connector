public class applicationSchedule implements Schedulable{

    public void execute(SchedulableContext sc){
ApplicationBatchTest abt = new ApplicationBatchTest ();
Database.executeBatch(abt); 

    }
}