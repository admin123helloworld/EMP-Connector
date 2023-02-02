public with sharing class flightWithWithout_cx {
 public list<Flight_schedule__c> flightlist {get;set;}
    public flightWithWithout_cx(ApexPages.StandardController controller) {
      flightlist=[select Flight__c,Source_location_country__c,Source_location_state__c,Status__c from Flight_schedule__c];
     
    }

}