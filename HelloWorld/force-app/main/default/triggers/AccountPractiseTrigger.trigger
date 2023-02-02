trigger AccountPractiseTrigger on Account (after update) {
  Map<id,Account> AccMap=new Map<id,Account> ();
    for(Account objAcc:trigger.new){
    if(objAcc.Type!=trigger.oldMap.get(objAcc.Id).Type){
        AccMap.put(objAcc.id,objAcc);
    }			}
    
list<contact> conlist=new list<contact> ();
    if(!AccMap.isEmpty()){
    for(contact objcon:[select id,Name,Leadsource,Level__c,Accountid from contact where Accountid IN:AccMap.keySet()]){
        conlist.add(objcon);
    }		}
    
    for(contact objcon:conlist){
        if(AccMap.containsKey(objcon.AccountId)){
            if(AccMap.get(objcon.AccountId).Type=='Other' && AccMap.get(objcon.AccountId).Rating=='Hot'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';
            }
        }
    }    
update conlist;
}