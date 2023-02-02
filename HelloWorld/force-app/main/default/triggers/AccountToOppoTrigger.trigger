trigger AccountToOppoTrigger on Account (before update) {
  Map<id,Account> AccMap=new Map<id,Account> ();
    for(Account objAcc:trigger.new){
        if((objAcc.Type!=trigger.oldMap.get(objAcc.id).Type) ||(objAcc.Description!=trigger.oldMap.get(objAcc.Id).Description)){
        AccMap.put(objAcc.id,objAcc);
        }       }
    list<Opportunity> opplist=new list<Opportunity> ();
    if(!AccMap.isEmpty()){
 for(Opportunity objopp:[select id,Amount,Name,AccountId from Opportunity where AccountId IN:AccMap.keySet()]){
     opplist.add(objopp);   }       }
    
    for(Opportunity objopp:opplist){
        if(AccMap.containsKey(objopp.AccountId)){
            if(AccMap.get(objopp.AccountId).Type=='Other' && objopp.Amount<10000){
AccMap.get(objopp.AccountId).Description=AccMap.get(objopp.AccountId).Description+'\n'+objopp.Name;         }         }
    }
    update opplist;
}