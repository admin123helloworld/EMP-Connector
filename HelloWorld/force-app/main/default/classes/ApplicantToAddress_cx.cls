public class ApplicantToAddress_cx {
 public list<Applicant__c> applist {get;set;}
    public ApplicantToAddress_cx(ApexPages.StandardController controller) {
      getAppAddRecord(); }
public void getAppAddRecord() {
  applist=[select First_Name__c,Last_Name__c,(select City__c from Addresses__r) from Applicant__c];}}