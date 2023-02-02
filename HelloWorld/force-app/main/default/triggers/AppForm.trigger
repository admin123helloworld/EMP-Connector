trigger AppForm on Application_Form__c (before insert,before update) {
  set <string> appset=new set <string> ();
    for(Application_Form__c objapp:trigger.new){
        if(string.isNotBlank(objapp.Student_Name__c)){
          appset.add(objapp.Student_Name__c);
        }
    }
 Map<string,Application_Form__c> appMap=new Map<string,Application_Form__c> ();
    for(Application_Form__c objapp:[select id,Address__c,Student_Name__c from Application_Form__c where Student_Name__c IN:appset]){
        appMap.put(objapp.Student_Name__c, objapp);
    }
    for(Application_Form__c objapp:trigger.new){
        if(appMap.containsKey(objapp.Student_Name__c)){
            if(objapp.LastModifiedDate!=trigger.oldMap.get(objapp.Id).LastModifiedDate){
                
            }
        }
    }
}