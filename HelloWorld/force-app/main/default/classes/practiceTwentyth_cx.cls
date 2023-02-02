public class practiceTwentyth_cx {
 public Account objacc;
    public practiceTwentyth_cx(ApexPages.StandardController controller) {
         objacc=(Account) controller.getRecord();  }
         
         public void save(){
             if(objacc.Type=='Prospect'){
             objacc.Rating='Hot';
             insert objacc;
             }
         
         }

}