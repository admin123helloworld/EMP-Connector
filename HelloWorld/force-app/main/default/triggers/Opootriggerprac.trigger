trigger Opootriggerprac on Opportunity (before insert) {
    for(Opportunity objOpp:trigger.new){
if(objOpp.StageName=='Closed Won' && objOpp.Amount>=5000 && objOpp.CloseDate.Month()==10 && objOpp.OrderNumber__c.startsWith('3') && objOpp.IsPrivate==true && objOpp.LeadSource=='Web'){
           objOpp.Description='Yahoo';    }   }   }