trigger AccountpractTrigger on Address__c (before insert) {
    for(Address__c objadd:trigger.new){
        if(objadd.Country__c=='India' || objadd.State__c=='Maharashtra'){
            objadd.City__c='Nagpur';
        }
    }
}