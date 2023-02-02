public class ContactsSubscribesTo_PE_TriggerHandler extends TriggerHandler{
    
    List<ConUser_event__e> newList;
    List<ConUser_event__e> oldList;
    Map<Id,ConUser_event__e> newMap;
    Map<Id,ConUser_event__e> oldMap;
    
    public ContactsSubscribesTo_PE_TriggerHandler(){
        newList = (List<ConUser_event__e>)Trigger.new;
        oldList = (List<ConUser_event__e>)Trigger.old;
        newMap = (MAP<Id,ConUser_event__e>)Trigger.newMap;
        oldMap = (MAP<Id,ConUser_event__e>)Trigger.oldMap;
        
    }
    
     public override void afterInsert() {
        for(ConUser_event__e event : newList){
            createRecord(event);        }

    }
    
    public static void createRecord(ConUser_event__e event){
        
    }
   		}