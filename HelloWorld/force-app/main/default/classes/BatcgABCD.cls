global class BatcgABCD implements Database.Batchable<sObject>{
    global Database.queryLocator start (Database.BatchableContext BC){
      return Database.getQueryLocator('') ; 
    } 
    global void execute(Database.BatchableContext BC,list<Account> Acclist){
        
    }
    global void finish (Database.BatchableContext BC){
        
    }
    
}