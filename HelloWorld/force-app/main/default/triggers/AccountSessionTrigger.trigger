trigger AccountSessionTrigger on Account (before insert) {
    for(Account objacc:trigger.new){
        if(objacc.Type=='Prospect'){
            objacc.Rating='Hot';   }
        else{objacc.Rating='Cold';}
    }
}