public class ScheduleClassPrac implements Schedulable {

    
    public void execute(SchedulableContext SC){
        BatchPractise objBatchPractise=new BatchPractise ();
        Database.executeBatch(objBatchPractise);
    }
}