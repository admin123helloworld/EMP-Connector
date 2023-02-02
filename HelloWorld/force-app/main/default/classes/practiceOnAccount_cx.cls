public class practiceOnAccount_cx {
 public Account objacc;
    public practiceOnAccount_cx(ApexPages.StandardController controller) {
        objacc= (Account) controller.getRecord(); }
        
    public void save() {
        if(objacc.Type=='Prospect') {
        objacc.Rating='Hot';
        insert objacc; } } }