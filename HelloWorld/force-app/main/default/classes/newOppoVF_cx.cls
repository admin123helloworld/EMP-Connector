public class newOppoVF_cx {
 public Opportunity objopp;
    public newOppoVF_cx(ApexPages.StandardController controller) {
     objopp= (Opportunity) controller.getRecord(); }
     
   public void save() {
    
   if(objopp.StageName=='Qualification') {
   objopp.Type='Existing Customer - Downgrade' ;
    insert objopp; 

   }
   
   }

}