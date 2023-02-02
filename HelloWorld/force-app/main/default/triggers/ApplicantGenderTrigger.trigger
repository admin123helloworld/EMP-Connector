trigger ApplicantGenderTrigger on Applicant__c (before insert) {
    for(Applicant__c objapp:trigger.new){
        if(string.isNotBlank(objapp.Gender__c)){
        if(objapp.Gender__c=='Male' || objapp.Gender__c=='Female'){
            objapp.Police_verification__c=true;
        }
    }
}
}