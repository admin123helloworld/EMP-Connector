trigger AddToAppPractiseTrigger on Address__c (after insert,after Update,after undelete) {
  set<id> AppIdSet=new set<id> ();
    for(Address__c objadd:trigger.new){
        if(objadd.Applicant__c!=null){
        AppIdSet.add(objadd.Applicant__c);
        }		}
 Map<id,Applicant__c> AppMap=new Map<id,Applicant__c> ();
    if(!AppIdSet.isEmpty()){
    for(Applicant__c objApp:[select id,Name,Police_verification__c from Applicant__c where id IN:AppIdSet]){
        AppMap.put(objApp.id, objApp);  }			}
    
    
    if(!AppMap.isEmpty()){
    for(Address__c objadd:trigger.new){
        if((AppMap.containsKey(objadd.Applicant__c)) && (AppMap.get(objadd.Applicant__c).Police_verification__c=true)){
            objadd.City__c='Nagpur';
        }
    }			}
}