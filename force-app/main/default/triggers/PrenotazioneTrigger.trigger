trigger PrenotazioneTrigger on Prenotazione__c (before insert, after insert) {
	if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            PrenotazioneHandler.checkBeforeInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            PrenotazioneHandler.checkAfterInsert(Trigger.new);
        }
    }
}