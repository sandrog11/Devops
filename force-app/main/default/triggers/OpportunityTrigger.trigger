trigger OpportunityTrigger on Opportunity (before insert) {
	if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            OpportunityHandler.checkBeforeInsert(Trigger.new);
        }
    }
}