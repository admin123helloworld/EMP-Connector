public class ApplicationBatchTest implements Database.Batchable<sobject>, Database.stateful {

    
    public Integer totalForms = 0; 
    public Integer totalConvertedForms = 0; // total no of 
    public Database.QueryLocator start(Database.BatchableContext bc){
       
        String applicationQuery = 'select id, name, Ready_to_Join__c from Application_Form__c';
        return Database.getQueryLocator(applicationQuery);
    }
    public void execute(Database.BatchableContext bc, List<Application_Form__c> formList){
       
for (Application_Form__c obj: formList){
totalForms++   ;
            if(obj.Ready_to_Join__c){
totalConvertedForms++ ;
            }
        }
    }
    public void finish(Database.BatchableContext bc){
        // emails ,
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // address, subject, content( data to sent to admins)
mail.setSubject(' Application form and student record data as of today ');
mail.setPlainTextBody(' Total no of application form records are : '+totalForms+ ' out of which no of students as per today : '+totalConvertedForms);
String[] emailAddess = new String[]{'testjohntestmill@gmail.com'};
mail.setToAddresses(emailAddess);   
Messaging.sendEmail(new  Messaging.SingleEmailMessage[]{ mail } );
    }
}