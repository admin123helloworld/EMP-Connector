public class SchedulableABCD implements Schedulable{
    
    public void execute(SchedulableContext SC){
        BatcgABCD objAbcd=new BatcgABCD ();
        Database.executeBatch(objAbcd);
    }

}