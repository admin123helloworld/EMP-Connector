trigger ApplicantBeforeTrigger on Applicant__c (before insert,before update) {
  set<string> appset=new set<string> ();
    for(Applicant__c objapp:trigger.new){
        if(string.isNotBlank(objapp.Email_ID__c)){
            appset.add(objapp.Email_ID__c);    } }
  delete([select id,Name,Email_ID__c from Applicant__c where Email_ID__c IN: appset]);
    
    
}