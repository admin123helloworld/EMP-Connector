trigger ContactToAccountTrigger on Contact (after insert,after Update,after Undelete) {
  Set<id> accIdSet=new Set<id> ();
    for(Contact objcon:trigger.new){
        if(objcon.AccountId!=null){
      accIdSet.add(objcon.AccountId);  
        }			}
  Map<Id,Account> accMap=new Map<Id,Account> ();
    for(Account objacc:[select id,Name,Type,Rating from Account where id IN:accIdSet]){
        if(!accIdSet.isEmpty()){
     accMap.put(objacc.id, objacc );   
        }		}
    for(Contact objcon:trigger.new){
        if(accMap.containsKey(objcon.AccountId)){
            if(objcon.LeadSource=='Web' && objcon.Level__c=='Primary'){
               accMap.get(objcon.AccountId).Rating='Hot';
               accMap.get(objcon.AccountId).Type='Other'; 
            }
        }
    }
    
    }