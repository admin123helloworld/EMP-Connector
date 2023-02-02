public class practiceonAjax_cx {
  public Account objacc;
  public list <Account> acclist{get;set;}
    public practiceonAjax_cx(ApexPages.StandardController controller) {
      objacc= (Account) controller.getRecord();
    }
 public void show(){
 system.debug('#Aapun ka record'+objacc.Type);
 acclist=[select Name,Type,Rating from Account where Type=:objacc.Type];
 }
}