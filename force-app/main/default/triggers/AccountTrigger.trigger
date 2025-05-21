trigger AccountTrigger on Account (before insert, after insert, before delete, before update) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            AccountHandler.checkBeforeInsert(Trigger.new);
        }
    }
    
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            List<Opportunity> listaOpp = new List<Opportunity>();
            for (Account acc: Trigger.New)
            {
                Opportunity opp = new Opportunity();
                opp.Name = 'OpportunityNameTrigger';
                opp.AccountId = acc.Id;
                opp.StageName ='ProvaStageTrigger';
                opp.CloseDate = Date.today();
                listaOpp.add(opp);
            }
            insert listaOpp;
            
            AccountHandler.checkAfterInsert(Trigger.New);
        }
    }
    if (Trigger.isBefore)
    {
        if (Trigger.isDelete)
        {
            //List<Contact> contatti = [Select AccountId FROM Contact where AccountId IN :Trigger.old ];
            //List<Opportunity> opportunity = [SELECT AccountId FROM Opportunity where AccountId IN :Trigger.old];
            Map<Id,Account> newLista = New Map<Id, Account>([SELECT Id, (Select id FROM Contacts ), (Select id FROM Opportunities) FROM Account WHERE Id IN :Trigger.Old]);
            for (Account a: Trigger.Old)
            {
                if (newLista.get(a.Id).contacts.size()!=0 ||newLista.get(a.Id).opportunities.size()!=0 )
                {
                    a.adderror('Errore. Contatto o Opportunity già associata.');
                }
                    
               /* for (Contact c: contatti)
                {
                    if (a.Id == c.AccountId)
                    {
                        a.addError('Non puoi eliminare questo account perché associato ad un contact');
                    }
                }
                for (Opportunity opp: opportunity)
                {
                    if (a.Id == opp.AccountId)
                    {
                        a.addError('Non puoi eliminare questo account perché associato ad una opportunity');
                    }
                }*/
                AccountHandler.checkBeforeDelete(Trigger.old);
            }
            
            
        }
    }
    if (Trigger.isBefore){
        if (Trigger.isUpdate){
            AccountHandler.sendEmailForActiveAccount(Trigger.New);
        }
    }
}