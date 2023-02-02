trigger AccountBeforeTrigger on Account (before insert,before update) {
    for(Account objacc:trigger.new){
        if(objacc.Type=='Prospect' && (objacc.Rating=='Hot' || objacc.Rating=='Warm')) {
            objacc.SLA__c='Silver'; }
        else{
           objacc.SLA__c='Gold';  }
    }
}