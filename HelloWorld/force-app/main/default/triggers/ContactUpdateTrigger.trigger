trigger ContactUpdateTrigger on Contact (after update) {

List<String>  contactList = new List<String>();
    
    System.debug('Trigger Chal hai== ');
    System.debug('isUpdate== '+trigger.isUpdate);
    System.debug('isAfter== '+trigger.isAfter);
    System.debug('new== '+trigger.new);
    System.debug('old== '+trigger.old);
    //checks
    if(trigger.isAfter && trigger.isUpdate){
        for(Contact con : trigger.new){
         System.debug('for == '+con.Id);
            contactList.add(con.Id);
        }
    }
    
    List<SubscribedTo__c>  subscribedUserList = [Select Id, Contact__c,User__r.Email from SubscribedTo__c where Contact__c in : contactList];
    System.debug('subscribedUserList== '+subscribedUserList);
    List<ConUser_event__e> platformEventList = new List<ConUser_event__e>();
    ConUser_event__e platformEvent = new ConUser_event__e();
    for (SubscribedTo__c obj : subscribedUserList){
        platformEvent.User_Email__c = obj.User__r.Email;
        platformEventList.add(platformEvent);
    }
    
    List<Database.SaveResult> results = EventBus.publish(platformEventList);
    
    for (Database.SaveResult saveresult : results) {
        if (saveresult.isSuccess()) {
            System.debug('Job Successful........');
        }
    }
    
}