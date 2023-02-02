Public class formHelper1{

public static void preventRecordDeletion(List<Application_Form__c>formlist){

        Set<id>formIdSet = new Set<id>();
        // map to store , key as application_form id and value as student record.
        Map<id, Student__c>formidStudentRecMap = new Map<id, Student__c>(); // map of application form id and student record.
for(Application_Form__c fm : formlist){
formIdSet.add(fm.id);
        }
if(formIdSet != null &&formIdSet.size() > 0){
            List<Student__c>stdList = [select id, Application_Form__c from Student__c where Application_Form__c IN :formIdSet];
if(stdList.size() > 0){
for(Student__c std : stdList){
formidStudentRecMap.put(std.Application_Form__c, std); // for Map put() to add data into map
                }
            }

if(formidStudentRecMap != null &&formidStudentRecMap.values().size() > 0){
for(Application_Form__c fm : formlist){
if(formidStudentRecMap.containsKey(fm.id) && formidStudentRecMap.get(fm.id) != null){
 
                    }
                }
            }
        }
    }
}