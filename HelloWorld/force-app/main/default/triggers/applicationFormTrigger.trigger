trigger applicationFormTrigger on Application_Form__c (before update, before delete) {


if(Trigger.isDelete && Trigger.isBefore){
        formHelper1.preventRecordDeletion(trigger.old);
    }

}