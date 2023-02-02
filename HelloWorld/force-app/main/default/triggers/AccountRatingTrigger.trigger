trigger AccountRatingTrigger on Account (before insert) {
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.Type)){
        if(objacc.Type=='Prospect'){
            objacc.Rating='Hot';
        }
    }
}
}