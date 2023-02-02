global class BatchOnAccount implements Database.Batchable<sObject>{

    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id,Name,Type,Rating from Account');
    }
    global void execute(Database.BatchableContext BC,list<Account> Acclist){
      Map<id,Account> AccMap=new Map<id,Account> (); 
        if(!Acclist.isEmpty()){
            for(Account objAcc:Acclist){
                AccMap.put(objAcc.id, objAcc);          }      }
        
      list<contact> conlist=new list<contact> ();
        if(!AccMap.isEmpty()){
        for(contact objcon:[select id,Name,leadsource,Level__c,AccountId from contact where AccountId IN:AccMap.keySet()]){
            conlist.add(objcon);
        }				}
       
        if(!conlist.isEmpty()){
        for(contact objcon:conlist){
            if(AccMap.containsKey(objcon.AccountId)){
                if(AccMap.get(objcon.AccountId).Type=='Other'){
                    objcon.LeadSource='Web';
                    objcon.Level__c='Primary';               }           }       }
        update conlist;
        
        }		}
    
    global void finish(Database.BatchableContext BC){
        
    }
}