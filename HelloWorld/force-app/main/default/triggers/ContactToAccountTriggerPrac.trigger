trigger ContactToAccountTriggerPrac on Contact (after insert,after update,after undelete) {
  Set<id> accIdSet=new Set <id> ();
    for(Contact objcon:trigger.new){
        if(objcon.AccountId!=null){
      accIdSet.add(objcon.AccountId);  
        }		}	
    
  }