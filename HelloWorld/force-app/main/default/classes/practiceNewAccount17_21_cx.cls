public class practiceNewAccount17_21_cx {
 public Account objacc;
    public practiceNewAccount17_21_cx(ApexPages.StandardController controller) {
     objacc=(Account) controller.getRecord(); }
     
     public void save(){
         if(objacc.Type=='Prospect') {
         objacc.Rating='Hot';
         insert objacc; } }}