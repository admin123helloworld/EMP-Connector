trigger CasePractiseTrigger on Case (after insert,after Update,after Undelete) {
  set<id> AccIdSet=new set<id> ();
    for(case objcase:trigger.new){
  if(objcase.AccountId !=null){
        AccIdSet.add(objcase.AccountId);     }		}
    
Map<id,Account> AccMap=new Map<id,Account> ();
    if(!AccIdSet.isEmpty()){
    for(Account objAcc:[select id,Name,Rating from Account where id IN:AccIdSet]){
        AccMap.put(objAcc.id,objAcc);  }		}
    
   list<Account> Acclist=new list<Account> ();  
    for(case objcase:trigger.new){
        if(AccMap.containsKey(objcase.AccountId)){
            if(objcase.Priority=='High' || objcase.Priority=='Medium'){
               AccMap.get(objcase.AccountId).Type='Hot';  }   }   }
    Acclist.addAll(AccMap.values());
    	update Acclist;
        }