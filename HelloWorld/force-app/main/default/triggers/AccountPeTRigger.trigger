trigger AccountPeTRigger on Account (after update) {
 Map<Id,Account> accMap=new Map<Id,Account> ();
    for(Account objAcc:trigger.new){
        if(objAcc.Type!=trigger.oldMap.get(objAcc.Id).Type){
      accMap.put(objAcc.id,objAcc);  
        }	}
 list<Contact> conlist=new list<Contact> ();
    for(Contact objcon:[select id,Name,Leadsource,Level__c,AccountId from Contact where Id IN:accMap.keySet()]){
        if(!accMap.isEmpty()){
		conlist.add(objcon);        
        }			}
 for(Contact objcon:conlist){
     if(accMap.containsKey(objcon.AccountId)){
         if(accMap.get(objcon.AccountId).Type=='Other' && accMap.get(objcon.AccountId).Rating=='Hot'){
         	objcon.Level__c='Primary';
             objcon.LeadSource='Web';
         }
     }
    }
    update conlist;
    
    
    
    
}