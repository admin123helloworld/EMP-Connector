trigger ContactLevelTrigger on Contact (after insert,after update,after undelete) { 
  set<id> accidset=new set<id> ();
    for(contact objcon:trigger.new){
        if(objcon.Accountid!=null){
            if(trigger.isAfter &&(trigger.isInsert || trigger.isUndelete)){
                accidset.add(objcon.Accountid);   }
            if(trigger.isAfter && trigger.isUpdate){
if((objcon.FirstName!=trigger.oldMap.get(objcon.Id).FirstName) || (objcon.LastName!=trigger.oldMap.get(objcon.Id).LastName)){
                     accidset.add(objcon.Accountid);      }  }  }}
    
   Map<id,Account> accMap=new Map<id,Account> ();
    if(accidset.isEmpty()){
    for(Account objacc:[select id,Name,Description from Account where id IN:accidset]){
        accMap.put(objacc.Id, objacc); }}
    
   list <Account> acclist=new list <Account> ();
    for(contact objcon:trigger.new){
        if(accMap.containsKey(objcon.Accountid)){
            accMap.get(objcon.Accountid).Description=objcon.FirstName+' '+objcon.LastName;   } }
    acclist.addAll(accMap.values());
    
    update acclist;
   }