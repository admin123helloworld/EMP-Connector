trigger ContactPractiseTrigger on Contact (after insert,after Update,after Undelete) {
  set<id> accIdSet=new set<id> ();
    for(contact objcon:trigger.new){
        if(objcon.AccountId!=null){
        accIdSet.add(objcon.AccountId);
        }		}
  Map<id,Account> AccMap=new Map<id,Account> ();
    if(!accIdSet.isEmpty()){
    for(Account objAcc:[select id,Name,Type,Rating from Account where id IN:accIdSet]){
        AccMap.put(objAcc.id, objAcc);
    }		}
    list<Account> Acclist=new list<Account> ();
    for(contact objcon:trigger.new){
        if(AccMap.containsKey(objcon.Accountid)){
            if(objcon.LeadSource=='Web' && objcon.Level__c=='Primary'){
                AccMap.get(objcon.AccountId).Type='other';
                AccMap.get(objcon.AccountId).Rating='Hot';
                	}		}    }
    Acclist.addAll(AccMap.values());
    update Acclist;
       
}