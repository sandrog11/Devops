trigger DuplicateStudentTrigger on Partecipazione__c (before insert) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            List<Sessione__c> sessioni = [SELECT Id, Numero_Partecipanti__c, Max_Numero_Partecipanti__c FROM Sessione__c];
            List<Partecipazione__c> partecipazioni = [SELECT Sessione__c, Studente__c FROM Partecipazione__c];
            for (Partecipazione__c p:Trigger.new)
            { 
                for (Partecipazione__c par: partecipazioni)
                {
                    if ((p.Sessione__c == par.Sessione__c) && (p.Studente__c == par.Studente__c))
                    {
                        p.adderror('Errore. Hai inserito uno studente già presente in questo corso');
                    }
                   
                }
                for (Integer i=0; i<sessioni.size(); i++)
                {
                    //il numero dei partecipanti è uguale al numero max dei partecipanti quindi se provo ad aggiungere una nuova partecipazione supero il limite max.
                    if (sessioni.get(i).Numero_Partecipanti__c == sessioni.get(i).Max_Numero_Partecipanti__c)
                    {
                        p.adderror('Errore. Hai superato il limite dei partecipanti per questo corso');
                    }
                
                }
            }
    }
    }
}