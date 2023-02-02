trigger ParentToChildTrigger on Contact (after insert,after update,after Undelete) {
  set<id> AccSetId=new set<id> ();
    for(contact objcon:trigger.new){
        if(objcon.AccountId!=null){
        AccSetId.add(objcon.AccountId);      }      }
    
    Map<id,Account> AccMap=new Map<id,Account> ();
    for(Account objAcc:[select id,Type from Account where id IN: AccSetId]){
        AccMap.put(objAcc.id, objAcc);  }
    
    for(contact objcon:trigger.new){
        if(AccMap.containsKey(objcon.AccountId) && AccMap.get(objcon.AccountId).Type=='Prospect'){
            objcon.LeadSource='Web';      }            } 
    
}