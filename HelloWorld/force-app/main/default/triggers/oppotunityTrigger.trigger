trigger oppotunityTrigger on Opportunity (before insert,before Update) {
    for(Opportunity objopp:trigger.new){
        if(objopp.Amount>=300 && objopp.Amount<=600 && objopp.StageName=='Closed Won'){
  objopp.Description='I am In Nagpur';   }
        else{objopp.Description='I am In Pune';}
    }   
    
}