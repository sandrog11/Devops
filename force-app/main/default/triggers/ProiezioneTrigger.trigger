trigger ProiezioneTrigger on Proiezione__c (before insert) {
	if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            ProiezioneHandler.checkBeforeInsert(Trigger.New);
        }
    }
}