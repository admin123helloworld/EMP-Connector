public class withWthout_practice_cx {
  public list<Applicant__c> applist{get;set;}
  public Integer totalRecords {get;set;}
    public withWthout_practice_cx(ApexPages.StandardController controller) {
        applist=[select First_Name__c,Last_Name__c,Gender__c,Age__c,DOB__c from Applicant__c];
        totalRecords=applist.size();
    }
}