Global class BatchConToAccount implements Database.Batchable<sObject>{
    
    Global Database.QueryLocator start(Database.BatchableContext BC){
return Database.getQueryLocator('select id,Name,LeadSource,FirstName,LastName,AccountId from contact where LeadSource=\'Web\'');
    }
    
    Global void execute(Database.BatchableContext BC,list<contact>conlist){
      set<id> AccIdSet=new set<id> ();  
        if(!conlist.isEmpty()){
            for(contact objcon:conlist){
                AccIdSet.add(objcon.AccountId);       }       }
        
      Map<id,Account> AccMap=new Map<id,Account> ();
        if(!AccIdSet.isEmpty()){
        for(Account objAcc:[select id,Name,Description from Account where id IN:AccIdSet]){
            AccMap.put(objAcc.id,objAcc);       }				}
        
        list<Account> Acclist=new list<Account> ();
        if(!AccMap.isEmpty()){
        for(contact objcon:conlist){
            if(AccMap.containsKey(objcon.AccountId)){
                if(String.isBlank(AccMap.get(objcon.AccountId).Description)){
                    AccMap.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName+' '+objcon.LeadSource;    }       }       }
        Acclist.addAll(AccMap.Values());
        update Acclist;
        }		}
    
    Global void finish (Database.BatchableContext BC){
        
    }

}