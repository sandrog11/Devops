trigger ContactTrigger on Contact (after insert) {
	if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            List<ContattoRelazionato__c> listacr = new List <ContattoRelazionato__c>();
            for (Contact con : Trigger.New)
            {
                if (con.CreaFiglio__c == true)
                {
                    ContattoRelazionato__c cr = new ContattoRelazionato__c();
                    cr.Contact__c = con.Id;
                    listacr.add(cr);
                }
            }
            insert listacr;
        }
    }
}