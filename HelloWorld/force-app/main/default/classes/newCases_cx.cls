public class newCases_cx {
   public Address__c objadd;
    public newCases_cx(ApexPages.StandardController controller) {
      objadd= (Address__c) controller.getrecord();  }
          public void save() {
           if(objadd.Country__c=='India'){
            objadd.State__c='Maharashtra';
            insert objadd;
           }
          
          }

}