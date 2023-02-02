trigger OppotoAccountTrigger on Opportunity (before insert,before Update,after undelete) {
 set<id> AccIdSet=new set<id> ();
    for(Opportunity objOpp:trigger.new){
        if(objOpp.AccountId!=null){
        AccIdSet.add(objOpp.AccountId);       }     }
    
Map<id,Account> AccMap=new Map<id,Account> ();
    if(AccIdSet!=null){
    for(Account objAcc:[select id,Name,Type from Account where id IN: AccIdSet]){
        AccMap.put(objAcc.Id,objAcc);   }       }
    
    for(Opportunity objOpp:trigger.new){
        if(AccMap.containsKey(objOpp.AccountId) && AccMap.get(objOpp.AccountId).Type=='Other' ){
            objOpp.Type='Existing Customer - Downgrade';
            objOpp.LeadSource='Purchased List';       }       }
    }