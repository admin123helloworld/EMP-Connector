public class practiceOfAjax_cx {
  public Account objacc;
  public list<Account>acclist{get;set;}
  
    public practiceOfAjax_cx(ApexPages.StandardController controller) {
        objacc=(Account) controller.getRecord();     }
        
    public void showRecord(){
      system.debug('Selected Rating'+objacc.Rating);
      acclist=[select Name,Type,Rating,Sic from Account where Rating=:objacc.Rating];
    }

}