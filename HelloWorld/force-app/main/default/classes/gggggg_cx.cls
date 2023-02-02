public class gggggg_cx {
 public list<Account>acclist {get;set;}
  public Integer totalRecords {get;set;}
  
    public gggggg_cx(ApexPages.StandardController controller) {
        wantRecords();
       }
      
      public void wantRecords(){
         acclist=[select Name,Type,Rating,Sic from Account where Type='Other'];
      totalRecords=acclist.size(); 
      }

}