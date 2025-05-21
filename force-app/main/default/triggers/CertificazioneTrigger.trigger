trigger CertificazioneTrigger on Certificazione_Acquisita__c (before insert, after insert) {
    if (Trigger.isBefore)
    {
           if (Trigger.isInsert)
           {
               List<Certificazione_Acquisita__c> certificazioni = [SELECT Studente__c FROM Certificazione_Acquisita__c];
               for (Certificazione_Acquisita__c cert:Trigger.New)
               {
                   for (Certificazione_Acquisita__c c: certificazioni)
                   {
                       if (cert.Studente__c == c.Studente__c)
                       {
                           cert.adderror('Questo studente ha già preso questa certificazione');
                       }
                   }
               }
           }
    }
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            Task newTsk = new Task();
            for (Certificazione_Acquisita__c ca:Trigger.New)
            {
                newTsk.Subject ='Certificazione ' + ca.Name+  ' acquisita correttamente';
                newTsk.Priority ='Normal';
                newTsk.Status ='Completed';
                newTsk.WhatId = ca.Studente__c;
                newTsk.OwnerId = ca.CreatedById;
            }
            insert newTsk;
        }
    }
}