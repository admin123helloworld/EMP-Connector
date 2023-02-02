trigger AccountPracTrigger on Account (after update) {
  set<string> AccSet=new set<string> ();
    for(Account objAcc:trigger.new){
        AccSet.add(objAcc.Name);
    }
}