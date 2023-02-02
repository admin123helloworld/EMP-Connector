trigger ContactsSubscribesTo_PE_Trigger on ConUser_event__e (after insert) {
    new ContactsSubscribesTo_PE_TriggerHandler().run();}