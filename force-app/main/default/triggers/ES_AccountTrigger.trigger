trigger ES_AccountTrigger on Account (before insert, before update) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            ES_AccountHandler.checkBeforeInsert(Trigger.New);
        }
    }
    if (Trigger.isBefore)
    {
        if (Trigger.isUpdate)
        {
            ES_AccountHandler.checkBeforeUpdate(Trigger.new);
        }
    }
}