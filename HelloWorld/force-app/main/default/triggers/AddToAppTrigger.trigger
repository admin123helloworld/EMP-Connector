trigger AddToAppTrigger on Address__c (after insert,after Update,after Undelete) {
  set<id> AppIdSet=new set<id>(); 
    for(Address__c objadd:trigger.new){
        if(objadd.Applicant__c!=null){
        AppIdSet.add(objadd.Applicant__c);      }          }
    
Map<id,Applicant__c> AppMap=new Map<id,Applicant__c> ();
    if(AppIdSet!=null){
    for(Applicant__c objApp:[select id,Name,Police_Verification__c from Applicant__c where id IN:AppIdSet]){
        AppMap.put(objApp.id, objApp);    }     }

list <Applicant__c> applist=new list <Applicant__c> ();    
    for(Address__c objadd:trigger.new){
        if(AppMap.containsKey(objadd.Applicant__c)){
            if(objadd.City__c=='Nagpur'){
              AppMap.get(objadd.Applicant__c).Police_Verification__c=true;     }       }    }
    applist.addAll(AppMap.values());
    Update applist;
}