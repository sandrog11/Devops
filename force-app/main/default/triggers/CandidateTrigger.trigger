trigger CandidateTrigger on Candidate__c (before insert, after insert) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            CandidateHandler.checkBeforeInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            CandidateHandler.checkAfterInsert(Trigger.New);
        }
    }
}