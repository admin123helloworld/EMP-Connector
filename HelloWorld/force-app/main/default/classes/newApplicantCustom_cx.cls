public with sharing class newApplicantCustom_cx {
  public Applicant__c objapp;
    public newApplicantCustom_cx(ApexPages.StandardController controller) {
     objapp= (Applicant__c) controller.getRecord();
    }
public void save(){

if(objapp.Gender__c=='Male' || objapp.Gender__c=='Female') {
 objapp.Police_verification__c=true;}
   else{
   objapp.Police_verification__c=false; }  
    insert objapp;
  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Record created successfully...!!!!'));  
 
 } }