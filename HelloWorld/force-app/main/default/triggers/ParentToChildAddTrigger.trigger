trigger ParentToChildAddTrigger on Address__c (after insert,after Update,after undelete) {
  set<id> addIdSet=new set<id> ();
    for(Address__c objadd:trigger.new ){
        if(objadd.Applicant__C!=null){
        addIdSet.add(objadd.Applicant__C);      }   }
    
 Map<id,Applicant__C> accMap=new Map<id,Applicant__C> ();
    for(Applicant__C objapp:[select id,Police_verification__c from Applicant__C where id IN:addIdSet]){
      accMap.put(objapp.id, objapp);       }
  
    list<Applicant__C> applist=new list<Applicant__C> ();
    for(Address__c objadd:trigger.new){
        if(accMap.containsKey(objadd.Applicant__C)){
            if(objadd.City__c=='Nagpur'){
                accMap.get(objadd.Applicant__C).Police_verification__c=true;     }     }    }
    applist.addAll(accMap.values());
    update applist;
    }