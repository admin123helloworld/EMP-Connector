global class BatchAccountPrac implements Database.batchable<sObject>{

    global Database.QueryLocator start(Database.batchableContext BC){
        return Database.getQueryLocator('');
    }    
    global void execute (Database.batchableContext BC,list<Account> Acclist){
        
    }
    global void finish(Database.batchableContext BC){
        
    }
}