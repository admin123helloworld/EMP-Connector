trigger AccountToOppTrigger on Account (before update) {
 Map<id,Account> AccMap=new Map<id,Account> (); 
    for(Account objAcc:trigger.new){
        if(objAcc.Type !=trigger.oldMap.get(objAcc.id).Type){
        AccMap.put(objAcc.id,objAcc);
        }       }
    
list<opportunity> opplist=new list<opportunity> ();
    if(!AccMap.isEmpty()){
    if(!AccMap.isEmpty()){
    for(opportunity objopp:[select id,Name,Amount,AccountID from opportunity where AccountID IN:AccMap.keySet()]){
        opplist.add(objopp);
    }       }       }
    if(!opplist.isEmpty()){
    for(opportunity objopp:opplist){
        if(AccMap.containsKey(objopp.AccountId)){
            if(AccMap.get(objopp.AccountId).Type=='Other' &&objopp.Amount<10000 ){
                AccMap.get(objopp.AccountId).Description=AccMap.get(objopp.AccountId).Description+'\n'+objopp.Name;
            }
        }       }
    update    opplist; 
    }
    
}