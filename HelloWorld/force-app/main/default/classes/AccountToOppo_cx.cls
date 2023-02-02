public class AccountToOppo_cx {
   public list<Account> acclist {get;set;}
    public AccountToOppo_cx(ApexPages.StandardController controller) {
      getAccountOppoRecord(); }
  
  public void  getAccountOppoRecord() {
    acclist=[select Name,Type,(select Id,SLA__c from Opportunities) from Account]; }}