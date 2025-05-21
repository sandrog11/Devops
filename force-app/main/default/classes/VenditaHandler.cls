public class VenditaHandler {
    public static void checkBeforeInsert(List<Vendite__c>newlist)
    {
        Set<Id>ticketId = new Set<Id>();
        for (Vendite__c v: newlist)
        {
            ticketId.add(v.Ticket__c);
        }
        List<Ticket__c>tik = new List<Ticket__c>([SELECT id, Totale_Biglietti_Disponibili__c, Data_Evento__r.Status__c FROM Ticket__c WHERE id IN :ticketId]);
        for (Vendite__c vd : newlist)
        {
            for (Ticket__c t: tik)
            {
                if (t.Totale_Biglietti_Disponibili__c < vd.Numero_di_biglietti_acquistati__c)
                vd.addError('Error. Non puoi vendere questo ticket poiché sono esauriti!');
                if (t.Data_Evento__r.Status__c == 'Cancellato')
                {
                    vd.addError('Error. Non puoi vendere perché questo biglietto perché l\'evento è stato cancellato');
                }
            }
                
        }
        }
	public static void checkAfterInsert(List<Vendite__c>newlist)
    {
        Set<Id>ticketId = new Set<Id>();
        Set<Id>dataeventoId = new Set<Id>();
        for (Vendite__c v: newlist)
        {
            ticketId.add(v.Ticket__c);
        }
        List<Ticket__c> tk = new List<Ticket__c>([SELECT id, Data_Evento__c, Totale_Biglietti_Disponibili__c, Totale_Biglietti_Venduti__c FROM Ticket__c WHERE id IN :ticketId]);
    	for (Vendite__c vd : newlist)
        {
            for (Ticket__c t : tk)
            {
                if (t.Totale_Biglietti_Disponibili__c >0)
                {
                     t.Totale_Biglietti_Disponibili__c -= vd.Numero_di_biglietti_acquistati__c;
                	t.Totale_Biglietti_Venduti__c += vd.Numero_di_biglietti_acquistati__c;
                    dataeventoId.add(t.Data_Evento__c);
                }
                else
                    vd.addError('Biglietti esauriti!');
            }
        }
        update tk;
        
        Map<Id, Data_Evento__c> dataevento = new Map<Id,Data_Evento__c>([SELECT id, Status__c, (SELECT Totale_Biglietti_Disponibili__c FROM Tickets__r) FROM Data_Evento__c WHERE id IN :dataeventoId]);
        boolean flag = false;
        
        for (Data_Evento__c de : dataevento.values())
        {
            for (Ticket__c t : dataevento.get(de.id).tickets__r)
            {
                if (t.Totale_Biglietti_Disponibili__c !=0)
                {
                    //non mettere sold out
                    flag = true;
                }
            }
            if (!flag)
            {
                de.Status__c = 'Sold out';
            }
            else
                flag=false;
        }
            update dataevento.values();
        
            
            
        
    }
    public static void checkAfterDelete(List<Vendite__c>oldvendite)
    {
        Set<Id> ticketid = new Set<Id>();
        Set<Id> dataeventoid = new Set<Id>();
        
        for (Vendite__c v : oldvendite)
        {
            ticketid.add(v.Ticket__c);
        }
        Map<Id, Ticket__c> tk = new Map<Id,Ticket__c>([SELECT id, Data_Evento__c, Totale_Biglietti_Disponibili__c, Totale_Biglietti_Venduti__c FROM Ticket__c WHERE id IN :ticketId]);
        for (Vendite__c vd : oldvendite)
        {
            tk.get(vd.Ticket__c).Totale_Biglietti_Disponibili__c += vd.Numero_di_biglietti_acquistati__c;
            tk.get(vd.Ticket__c).Totale_Biglietti_Venduti__c -= vd.Numero_di_biglietti_acquistati__c;
            dataeventoid.add(tk.get(vd.Ticket__c).Data_Evento__c);
        }
        update tk.values();
        
        //ritorno a opened lo status di Open Data se la vendita viene cancellata
        Map<Id, Data_Evento__c> newmap = new Map<Id,Data_Evento__c>([SELECT id, Status__c FROM Data_Evento__c WHERE id IN :dataeventoid ]);
        
        for (Data_Evento__c de: newmap.values())
        {
            //se lo status era sold out lo risetto ad aperto perché ci sono nuovi biglietti disponibili
            if (de.Status__c == 'Sold out')
            {
                de.Status__c = 'Aperto';
            }
        }
        update newmap.values();
    }
}