trigger ContactTrigger on Contact (after insert,after update,after undelete) {
   set<id> AccIdSet=new set<id> ();
    for(contact objcon:trigger.new){
        if(objcon.AccountId!=null){
        AccIdSet.add(objcon.AccountId);     }}
  
    Map<id,Account> AccMAp=new Map<id,Account> ();
    for(Account objacc:[select id,Description  from Account where id IN:AccIdSet]){
        AccMAp.put(objacc.id, objacc);  }
    
 list <Account> acclist=new list <Account> ();
    for(contact objcon:trigger.new){
        if(AccMAp.containsKey(objcon.AccountId)){
            AccMAp.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName;     }        }
    acclist.addAll(AccMAp.values());
    update acclist;
}