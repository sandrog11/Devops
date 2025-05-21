trigger SendEmailTrigger on Studente__c (after insert) {
    if (Trigger.isAfter)
    {
        if (Trigger.isInsert)
        {
            List<Studente__c> listaStudenti = [SELECT email__c FROM Studente__c WHERE email__c != NULL];
            for (Studente__c st:Trigger.New)
            {
                List<String> email = new List<String>();
                email.add(st.Email__c);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(email);
                mail.setSubject('Welcome Student');
                mail.setPlainTextBody('Benvenuto '+ st.Nome__c +' '+ st.Cognome__c+' !'+ '\nSei stato inserito correttamente sulla piattaforma Salesforce');
                Messaging.SendEmailResult[] results = Messaging.sendEmail(
                    new Messaging.SingleEmailMessage[]{mail});
                system.debug(results);
            }
        }
    }
}