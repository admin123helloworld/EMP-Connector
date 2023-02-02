trigger ApplicantTrigger on Applicant__c (after update) {
  Map<id,Applicant__c> AppMap=new Map<id,Applicant__c> (); 
    for(Applicant__c objapp:trigger.new){
        if(objapp.Police_verification__c !=trigger.oldMap.get(objapp.id).Police_verification__c){
        AppMap.put(objapp.id, objapp);
        }           }
    
list<Address__c> addlist=new list<Address__c> ();
    if(!AppMap.isEmpty()){
    for(Address__c objAdd:[select id,Name,City__c,Applicant__c from Address__c where Applicant__c IN:AppMap.keySet()]){
        addlist.add(objAdd);
    }       }
    
for(Address__c objAdd:addlist){
    if(AppMap.containsKey(objAdd.Applicant__c)){
        if(AppMap.get(objAdd.Applicant__c).Police_verification__c=true){
            objAdd.City__c='Nagpur';
        }
    }
}           }