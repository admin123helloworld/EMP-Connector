public with sharing class practiceOnAccountaccount_cx {
  public list<Account> acclist {get;set;}
  public integer totalRecords {get;set;}
    public practiceOnAccountaccount_cx(ApexPages.StandardController controller) {

    acclist=[select Name,Type,Rating,Sic from Account];
    totalRecords=acclist.size();  }  }