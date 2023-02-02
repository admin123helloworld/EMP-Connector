public without sharing class withWithout_VF_cx {

  public list<Account> acclist{get;set;}
  public integer totalRecords {get;set;}
  
    public withWithout_VF_cx(ApexPages.StandardController controller) {
  acclist=[select Name,Type,Rating,Sic from Account];
  totalRecords=acclist.size(); }

}