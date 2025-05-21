public class ContactHandler {
	public static void checkAfterInsert(List<Contact>newlistContact)
    {
        //controllare newlist se è vuota
        List<Pagella__c> listap = new List<Pagella__c>();
        for(Contact c:newlistContact)
        {
            if ('Ammesso'.equalsIgnoreCase(c.Ammissione__c) && String.isNotBlank(c.Ammissione__c))
            {
                Pagella__c pagella = new Pagella__c();
                pagella.Nome_Alunno__c = c.Name;
                pagella.Voto__c = 0;
                listap.add(pagella);
            }
        }
        insert listap;
    }
    public static void checkAfterUpdate(List<Contact>newlistContact)
    {
        
    }
}