trigger VenditaTrigger on Vendite__c (before insert, after insert, after delete) {
	if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            VenditaHandler.checkAfterInsert(Trigger.new);
        }
    }
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            VenditaHandler.checkBeforeInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isDelete)
        {
            VenditaHandler.checkAfterDelete(Trigger.old);
        }
    }
}