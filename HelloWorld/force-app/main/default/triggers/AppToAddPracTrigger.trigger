trigger AppToAddPracTrigger on Applicant__c (after update) {
Map<id,Applicant__c> AppMap=new Map<id,Applicant__c> ();
    for(Applicant__c objapp:trigger.new){
if((objapp.Police_verification__c !=trigger.oldMap.get(objapp.id).Police_verification__c)||(objapp.Gender__c!=trigger.oldMap.get(objapp.Id).Gender__c) ){
    AppMap.put(objapp.id,objapp);   }       }
        
list<Address__c> addlist=new list<Address__c> ();
    if(!AppMap.isEmpty()){
    for(Address__c objadd:[select id,Name,City__c,Applicant__c from Address__c where Applicant__c IN:AppMap.keySet()]){
        addlist.add(objadd);  }         } 
    
    for(Address__c objadd:addlist){
        if(AppMap.containsKey(objadd.Applicant__c)){
            if(AppMap.get(objadd.Applicant__c).Police_verification__c==true && AppMap.get(objadd.Applicant__c).Gender__c=='Male'){
                objadd.City__c='Nagpur';       }       }
        update addlist;
    }
}