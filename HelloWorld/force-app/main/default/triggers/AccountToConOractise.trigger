trigger AccountToConOractise on Account (after update) {
 Map<id,Account> AccMap=new Map<id,Account>();
    for(Account objacc:trigger.new){
if(objacc.Type !=trigger.oldMap.get(objacc.id).Type){
        AccMap.put(objacc.id,objacc);
        }       }
    
list <contact> conlist=new list <contact> ();
    if(!AccMap.isEmpty()){
    for(contact objcon:[select id,Name,LeadSource,Level__c,AccountID from contact where AccountID IN:AccMap.keySet()]){
        conlist.add(objcon);  }     }
    
    if(!conlist.isEmpty()){
    for(contact objcon:conlist){
        if(AccMap.containsKey(objcon.AccountId)){
            if(AccMap.get(objcon.AccountId).Type=='Other'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';       }
            else {
                objcon.LeadSource='';
                objcon.Level__c='';         }       }
        update conlist;
    }
    }       }