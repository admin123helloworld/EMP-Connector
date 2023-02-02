trigger CaseToAccountTriggerPrac on Case (before insert,before Update,after undelete) {
  set<id> AccIdSet=new set<id> ();
    for(case objcase:trigger.new){
        if(objcase.AccountID !=null){
        AccIdSet.add(objcase.AccountID);
        }       }
    
map<id,Account> AccMap=new map<id,Account> ();
    if(!AccIdSet.isEmpty()){
    for(Account objacc:[select id,Name,Rating from Account where id IN:AccIdSet]){
        AccMap.put(objacc.id,objacc);   }       }
    
    for(case objcase:trigger.new){
        if(AccMap.containsKey(objcase.AccountID) && AccMap.get(objcase.AccountID).Type=='Other'){
            objcase.Priority='High';
        }
    }
    
}