trigger triggerOppoTrigger on Opportunity (before insert,before Update) {
    for(Opportunity objopp:trigger.new){
        if(objopp.Amount>=3000 && objopp.Amount<=9000 && objopp.StageName=='Closed Won' ){
            objopp.Description='Helloo Nagpur';   }
        else{objopp.Description='Helloo Pune';}
    }
}