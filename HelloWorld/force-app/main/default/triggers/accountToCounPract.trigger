trigger accountToCounPract on Account (after update) {
  Map<id,Account> accMap=new Map<id,Account> ();
    for(Account objacc:trigger.new){
        if(objacc.Type!=trigger.oldMap.get(objacc.id).Type){
		accMap.put(objacc.id, objacc);
        }		}
 list <Contact> conlist=new list<Contact> ();
    for(Contact objcon:[select id,Name,Leadsource,Level__c,AccountId from contact where id IN:accMap.keySet()]){
        if(!accMap.isEmpty()) {
        conlist.add(objcon);
        }		}
    for(Contact objcon:conlist){
        if(accMap.containsKey(objcon.AccountId)){
            if(accMap.get(objcon.AccountId).Type=='Other' && accMap.get(objcon.AccountId).Rating=='Hot'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';
            }
        }
    }
    update conlist;
  }