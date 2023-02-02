trigger AccountToConTrigger on Account (after update) {
  Map<id,Account> accMap=new Map<id,Account> ();
    for(Account objAcc:trigger.new){
        if(objAcc.Type!=trigger.oldMap.get(objAcc.id).Type){
        accMap.put(objAcc.id,objAcc);        }         }
    
    list<contact> conlist=new list<contact> ();
    if(!accMap.isEmpty()){
    for(contact objcon:[select id,Level__c,LeadSource,AccountId from contact where AccountId IN:accMap.keySet()]){
        conlist.add(objcon);  }}
    
   
    if(!conlist.isEmpty()){
    for(contact objcon:conlist){
        if(accMap.containsKey(objcon.AccountId)){
            if(accMap.get(objcon.AccountId).Type=='Other'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';            }
            else{
                objcon.LeadSource='';
                objcon.Level__c=''; 
            }}      }       }
    update conlist;
}