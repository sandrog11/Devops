trigger EventoTrigger on Evento__c (before insert) {
	if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            EventoHandler.checkBeforeInsert(Trigger.new);
        }
    }
}