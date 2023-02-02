public class practiceOnPolar_cx {
 public list<Account> acclist{get;set;}
  public Integer totalRecords {get;set;} 
    
    public practiceOnPolar_cx(ApexPages.StandardController controller) {
        getRecord();
         }
        
    public void getRecord(){
         acclist=[select Name,Type,Rating,Sic from Account where Type='Other'];
        totalRecords=acclist.size();
    }

}