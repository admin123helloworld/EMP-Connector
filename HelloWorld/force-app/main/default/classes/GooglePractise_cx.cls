public with sharing class GooglePractise_cx {
  public list<Account> acclist{get;set;}
  public Integer totalRecords{get;set;}
  
    public GooglePractise_cx(ApexPages.StandardController controller) {
        acclist=[select Name,Type,Rating,Sic from Account where Rating='Hot'];
        totalRecords=acclist.size();    }

}