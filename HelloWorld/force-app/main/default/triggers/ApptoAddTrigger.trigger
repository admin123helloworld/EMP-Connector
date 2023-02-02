trigger ApptoAddTrigger on Applicant__c (after update) {
  Map<id,Applicant__c> AppMap=new Map<id,Applicant__c> ();
    for(Applicant__c objapp:trigger.new){
if((objapp.Police_verification__c!=trigger.oldMap.get(objapp.id).Police_verification__c)||(objapp.Gender__c!=trigger.oldMap.get(objapp.id).Gender__c)){
        AppMap.put(objapp.id,objapp);        }      }
    
    list<Address__c> addList=new list<Address__c> ();
for(Address__c objAdd:[select id,City__c,Pin_code__c,Applicant__c from Address__c where Applicant__c IN:AppMap.keySet()]){
       addList.add(objAdd);  }
    
    for(Address__c objAdd:addList){
        if(AppMap.containsKey(objAdd.Applicant__c)){
if(AppMap.get(objAdd.Applicant__c).Police_verification__c==true && AppMap.get(objAdd.Applicant__c).Gender__c=='Male' ){
                string pincode=string.valueOf(objAdd.Pin_code__c);
    if(pincode.startsWith('44')){
        objAdd.City__c='Nagpur';}
    else{ objAdd.City__c='';}
            }
        }
    }
    update addList;
}