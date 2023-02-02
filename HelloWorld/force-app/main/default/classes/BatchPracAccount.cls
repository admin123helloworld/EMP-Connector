global class BatchPracAccount implements Database.Batchable<sObject>{
    global Database.queryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('');
    }
    global void execute(Database.BatchableContext BC,list<Account> acclist){
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}