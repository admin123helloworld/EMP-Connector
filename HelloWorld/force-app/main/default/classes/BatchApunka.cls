public class BatchApunka implements Database.Batchable<sObject>{
			
    public Database.QueryLocator start (Database.BatchableContext BC){
        return Database.getQueryLocator('');
    }
    
    public void execute (Database.BatchableContext BC,list<Account> Acclist){
        
    }
    
    public void finish (Database.BatchableContext BC){
        
    }
    
}