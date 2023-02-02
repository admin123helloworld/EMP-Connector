public class cocacola_practise_cx {
 public Account objacc;
    public cocacola_practise_cx(ApexPages.StandardController controller) {
        objacc= (Account) controller.getRecord(); }
        
    public void save(){
     if(objacc.Type=='Prospect'){
         objacc.Rating='Hot';
         insert objacc; }
    
    }

}