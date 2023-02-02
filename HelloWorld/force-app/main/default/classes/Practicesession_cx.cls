public without sharing class Practicesession_cx {
  public list<Account> acclist {get;set;}
  public Integer totalRecords {get;set;}
 
    public Practicesession_cx(ApexPages.StandardController controller) {
      acclist=[select Name,Type,Rating,Sic from Account];
       totalRecords=acclist.size(); }
      
}