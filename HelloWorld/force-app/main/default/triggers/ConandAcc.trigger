trigger ConandAcc on Contact (after insert,after update, after delete) {
  Set<Id> accIdSet=new Set <Id> ();
    for(Contact objcon:trigger.new){
      if(objcon.AccountId!=null){
        accIdSet.add(objcon.AccountId);
        }       }
 Map<id,Account> accMap=new Map<id,Account> ();
    for(Account objAcc:[select id,Name,Type,Rating from Account where Id IN:accIdSet]){
        if(!accIdSet.isEmpty()){
      accMap.put(objAcc.Id, objAcc);  
        }       }
    list<Account> acclist=new list<Account> ();
    for(Contact objcon:trigger.new){
        if(accMap.containsKey(objcon.AccountId)){
            if(objcon.Level__c=='Primary' && objcon.LeadSource=='Web'){
                accMap.get(objcon.AccountId).Type='Other';
                accMap.get(objcon.AccountId).Rating='Hot';            }        }    }
    acclist.addAll(accMap.values());
    update acclist;


}