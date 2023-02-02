public class ContactToAccount_cx {
    public list<Account> acclist {get;set;}
    public ContactToAccount_cx(ApexPages.StandardController controller) {
          getAccountContactrecord();  }
          
    public void getAccountContactrecord(){
        acclist=[select Name,Type,Rating,(select Name from Contacts ) from Account where Type='Prospect' ];  }}