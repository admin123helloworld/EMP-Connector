public class newAccountCustom_cx {
  public list<Account> acclist {get;set;}
    public newAccountCustom_cx(ApexPages.StandardController controller) {
      acclist=[select Name,Type,Rating from Account where Type='Prospect' or Type='Prospect'  ];
    }

}