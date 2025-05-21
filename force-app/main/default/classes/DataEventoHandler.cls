public class DataEventoHandler {
    //non creare DataEvento se Status di oggetto Evento è 'Cancellato'
    public static void checkBeforeInsert(List<Data_Evento__c>newlist)
    {
        List<Evento__c> eventi = new List<Evento__c>([SELECT id, Status__c FROM Evento__c WHERE Status__c = 'Cancellato']);
        for (Data_Evento__c de : newlist)
        {
            for (Evento__c e : eventi)
            {
               if (de.Evento__c == e.Id)
               {
                   de.addError('Errore. Non puoi creare questo Data Evento poiché associato ad un Evento cancellato');
               }
            }
        }
    }
	public static void checkAfterInsert(List<Data_Evento__c>newlist)
    {
        List<Ticket__c> ticket = new List<Ticket__c>();
         
        for (Data_Evento__c de:newlist)
        {
            if (de.Biglietti_Gallery_Disponibili__c >0 && de.Id !=null)
            {
                Ticket__c tk = new Ticket__c();
                tk.Data_Evento__c = de.Id;
                tk.Tipo_Biglietto__c = 'Gallery';
                tk.Prezzo__c = de.Prezzo_Biglietti_Gallery__c;
                tk.Totale_Biglietti_Disponibili__c = de.Biglietti_Gallery_Disponibili__c;
                ticket.add(tk);
            }
            if (de.Biglietti_Stalls_Disponibili__c >0 && de.Id !=null)
            {
                Ticket__c tk = new Ticket__c();
                tk.Data_Evento__c = de.Id;
                tk.Tipo_Biglietto__c = 'Stalls';
                tk.Prezzo__c = de.Prezzo_Biglietti_Stalls__c;
                tk.Totale_Biglietti_Disponibili__c = de.Biglietti_Stalls_Disponibili__c;
                ticket.add(tk);
            }
            if (de.Biglietti_Standing_Disponibili__c >0 && de.Id !=null)
            {
                Ticket__c tk = new Ticket__c();
                tk.Data_Evento__c = de.Id;
                tk.Tipo_Biglietto__c = 'Standing';
                tk.Prezzo__c = de.Prezzo_Biglietti_Standing__c;
                tk.Totale_Biglietti_Disponibili__c = de.Biglietti_Standing_Disponibili__c;
                ticket.add(tk);
            }
        }
        insert ticket;
    }
    public static void checkAfterUpdate(List<Data_Evento__c> newlist, Map<Id, Data_Evento__c>oldde)
    {
        //in caso di modifiche al dataevento si manda una mail al cliente e ai seller
        /*Set<Id> dataeventi = new Set<Id>();
        for (Data_Evento__c de:newlist)
        {
            dataeventi.add(de.Id);
        }*/
        Map<Id, Vendite__c> newmap = new map<Id, Vendite__c>([Select id, Contact__r.email, Contact__r.FirstName, Contact__r.LastName, 
             Ticket__r.Data_Evento__c, Ticket__r.Data_Evento__r.Data__c, Ticket__r.Data_Evento__r.Nome__c, Ticket__r.Data_Evento__r.Luogo__c, Ticket__r.Data_Evento__r.Status__c, Ticket__r.Data_Evento__r.Orario__c
             From Vendite__c Where Ticket__r.Data_Evento__c IN :newlist]);
        
        //creo una lista per prendermi i seller a cui inviare l'email
        List<User> seller = new List<User>([select user.id, user.Email,user.FirstName,user.LastName,user.profile.name FROM user WHERE user.profile.name = 'Seller']);
        
        //system.debug(newmap.values());
        Data_Evento__c oldDataEvento = oldde.values();
        //Create new mail
        	List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mailCliente = new Messaging.SingleEmailMessage();
        Messaging.SingleEmailMessage mailSeller = new Messaging.SingleEmailMessage();
        for (Vendite__c vd : newmap.values())
        {
            
            for (User u : seller)
            {
            if (vd.Ticket__r.Data_Evento__r.Data__c != oldDataEvento.Data__c || vd.Ticket__r.Data_Evento__r.Orario__c != oldDataEvento.Orario__c || vd.Ticket__r.Data_Evento__r.Status__c != oldDataEvento.Status__c)
        {
                
            
            //lista dei destinatari email
            List<String> sendTo = new List<String>();
            sendTo.add(vd.Contact__r.email);
            sendTo.add(String.valueOf(u.Email));
            mailCliente.setToAddresses(sendTo);
            mailSeller.setToAddresses(sendTo);
            mailCliente.setSenderDisplayName('Event planner');
            mailSeller.setSenderDisplayName('Event planner');
            mailCliente.setSubject('Cambiamento data orario');
            mailSeller.setSubject('Cambiamento data orario');
                Datetime data = vd.Ticket__r.Data_Evento__r.Data__c;
                Time orario = vd.Ticket__r.Data_Evento__r.Orario__c;
                
                
            String body = 'Gentile cliente '+ vd.Contact__r.FirstName + ' '+ vd.Contact__r.LastName + ',\n\n'+
                'La contattiamo per informarla che l\'evento: \''+ vd.Ticket__r.Data_Evento__r.Nome__c +'\' \npresso \''+ vd.Ticket__r.Data_Evento__r.Luogo__c +'\' a cui lei è prenotato ha subito delle modifiche.\n'+
                'Di seguito mostriamo la nuova data e il nuovo orario\n'+'La nuova Data è: ' + data.day()+ ' '+ data.format('MMMMM')+ ' ' + data.year()+'\n'+ 
                'Il nuovo Orario è: '+ orario.hour()+ ':'+ orario.millisecond() + '\n\nCordiali saluti!';
            String bodyseller = 'Gentile venditore '+ u.FirstName + ' '+ u.LastName +',\n\n'+
                'La contattiamo per informarla che l\'evento: \''+ vd.Ticket__r.Data_Evento__r.Nome__c +'\' \npresso '+ vd.Ticket__r.Data_Evento__r.Luogo__c +'\' ha subito delle modifiche.\n'+
                'Di seguito mostriamo la nuova data e il nuovo orario'+'La nuova Data è :' + data.day()+ ' '+ data.format('MMMMM')+ ' ' + data.year()+'\n'+
                'Il nuovo Orario è: '+ vd.Ticket__r.Data_Evento__r.Orario__c + '\n\nCordiali saluti!';
            mailCliente.setPlainTextBody(body);
            mailSeller.setPlainTextBody(bodyseller);
            mails.add(mailCliente);
            mails.add(mailSeller);
        } 
            
        }
        }
        Messaging.SendEmailResult[]results = Messaging.sendEmail(mails);
        
    }
}