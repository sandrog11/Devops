trigger SessioneTrigger on Sessione__c (before delete) {
    if (Trigger.isBefore)
    {
        if (Trigger.isDelete)
        {
            for (Sessione__c s: Trigger.old)
            {
                if (s.Data_Fine__c >= Date.today())
                {
                    s.addError('Impossibile eliminare poiché la data di fine ancora non è passata');
                }
            }
        }
    }
}