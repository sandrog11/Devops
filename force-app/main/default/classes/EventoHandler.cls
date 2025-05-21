public class EventoHandler {
	public static void checkBeforeInsert(List<Evento__c>neweventi)
    {
        for (Evento__c e:neweventi)
        {
            e.Status__c = 'Aperto';
        }
    }
}