public class PrenotazioneHandler {
	public static void checkBeforeInsert(List<Prenotazione__c>pr)
    {
        Set<Id>filmId = new Set<Id>();
        Set<Id>saleid = new Set<Id>();
        for (Prenotazione__c p : pr)
        {
            filmId.add(p.Film__c);
        }
        Map<Id, Film__c> film = new Map<Id,Film__c>([SELECT id, Data_Inizio__c, Data_Fine__c FROM Film__c WHERE id IN :filmId]);
        for (Prenotazione__c pren:pr)
        {
            for (Film__c f: film.values())
            {
                if (pren.Data_Prenotazione__c < f.Data_Inizio__c)
                {
                    pren.addError('Error.\nIl film ancora deve uscire\nNon puoi prenotarlo!');
                }
                else if(pren.Data_Prenotazione__c > f.Data_Fine__c)
                {
                    pren.addError('Error.\nIl film non è più in Sala! Non puoi più prenotarlo!');
                }
            }
        }
        //controllo che la sala abbia ancora posti disponibili 
        for (Prenotazione__c prenot : pr)
        {
            if(prenot.Posti_Disponibili__c ==0)
            {
                prenot.addError('Posti terminati per questa sala!');
            }
        } 
    }
    
    //MANDO EMAIL DOPO CREAZIONE PRENOTAZIONE
    public static void checkAfterInsert(List<Prenotazione__c>newp)
    {
        Set<Id> clientiId = new Set<Id>();
        for (Prenotazione__c p : newp)
        {
            clientiId.add(p.Cliente__c);
        }
        Map<Id, Cliente__c> mapcl = new Map<Id,Cliente__c>([SELECT id, email__c, Nome__c, Cognome__c FROM Cliente__c WHERE id IN :clientiId]);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        for (Prenotazione__c p : newp)
        {
            for (Cliente__c cl : mapcl.values())
            {
                List<String> email = new List<String>();
        		email.add(cl.email__c);
                mail.setToAddresses(email);
                mail.setSubject('Welcome Client');
                mail.setPlainTextBody('Benvenuto '+ cl.Nome__c +' '+ cl.Cognome__c+' !'+ '\nSei stato inserito correttamente sulla piattaforma Cinema Digitale');
            }
            Messaging.SendEmailResult[] results = Messaging.sendEmail(
                    new Messaging.SingleEmailMessage[]{mail});
            
        }
        
    }
}