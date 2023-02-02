public with sharing class newAccountVF_cx {
   public Account objaccount;

    public newAccountVF_cx(ApexPages.StandardController controller) {
        objaccount=(Account) controller.getRecord();   }

public void save() {

if(objaccount.Type=='Prospect'){
 objaccount.Rating='Hot';
insert objaccount;

}}}