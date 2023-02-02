public class ajax_VF_cx {
 public Account objacc;
  public list <Account> acclist {get;set;}

    public ajax_VF_cx(ApexPages.StandardController controller) {
      objacc=(Account) controller.getRecord();
    }
    
    public void showRecord(){
    system.debug('#Selected type'+objacc.Type);
    acclist=[select Name,Type,rating from Account where Type=:objacc.Type];
    }

}