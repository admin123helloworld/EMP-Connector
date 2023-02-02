trigger AccountTypeTrigger on Account (before insert) {
    for(Account objacc:trigger.new){
        if(objacc.Ownership=='Public'){
            objacc.Rating='Hot'; }
        else{objacc.Rating=' '; }
        
    }
    }