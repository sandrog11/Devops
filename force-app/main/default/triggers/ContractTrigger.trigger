trigger ContractTrigger on Contract (before insert) {
	if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            ContractHandler.checkBeforeInsert(Trigger.new);
        }
    }
}