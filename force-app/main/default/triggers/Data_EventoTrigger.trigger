trigger Data_EventoTrigger on Data_Evento__c (before insert,after insert, after update) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            DataEventoHandler.checkBeforeInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            DataEventoHandler.checkAfterInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isUpdate)
        {
            DataEventoHandler.checkAfterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    
}