trigger ApplicantPracTrigger on Applicant__c (before insert,before update) {
    for(Applicant__c objApp:trigger.new){
 if(string.isNotBlank(objApp.Gender__c)){
        if(objApp.Gender__c=='Male' && objApp.DOB__c.Month()==9){
           objApp.Req_Doc_list__c='PAN card';    }      }
        
        if(objApp.Gender__c=='Transgender'){
objApp.Gender__c.addError('Not Allowed');     }
        
        if(string.isBlank(objApp.Email_ID__c)){
            objApp.Email_ID__c.addError('EmailID shoud not blank');   }   }     }