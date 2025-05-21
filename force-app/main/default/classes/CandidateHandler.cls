public class CandidateHandler {
	public static void checkBeforeInsert(List<Candidate__c> newCandidate)
    {
        for (Candidate__c c: newCandidate)
        {
            if (c.Email__c == null)
            {
                c.adderror('Error. Non puoi creare il candidato finché non inserisci la sua mail');
            }
        }
    }
    public static void checkAfterInsert(List<Candidate__c> newCandidate)
    {
        Task newTsk = new Task();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            for (Candidate__c ca : newCandidate)
            {
                //Creazione task che viene assegnato direttamente al candidato
                newTsk.Subject ='Task  ' + ca.Name+  ' assegnato correttamente';
                newTsk.Priority ='Normal';
                newTsk.Status ='Completed';
                newTsk.WhatId = ca.Id;
                newTsk.OwnerId = ca.CreatedById;
                //Creazione email che viene inviata direttamente al candidato
                List<String> email = new List<String>();
                email.add(ca.Email__c);
                mail.setToAddresses(email);
                mail.setSubject('Welcome Candidate');
                mail.setPlainTextBody('Benvenuto '+ ca.First_Name__c +' '+ ca.Last_Name__c+' !'+ '\nSei stato inserito correttamente sulla piattaforma Salesforce');
                
            }
        		Messaging.SendEmailResult[] results = Messaging.sendEmail(
                new Messaging.SingleEmailMessage[]{mail});
                system.debug(results);
            	insert newTsk;
        
        		
    }
}