trigger Payment_Trigger on Payment__c (after insert) {
	if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
        }
    }
}