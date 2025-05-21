public class AccountHandler {
	public static void checkBeforeInsert(List<Account> newAccount)
    {	
        List<String> names = new List<String>();
        for (Account a: newAccount)
        {
            names.add(a.Name);
        }
        if (names.size()> 0)
        {
            List<Account>doppio = [SELECT Name FROM Account WHERE Name IN :names];
            for (Account a: newAccount)
            {
                if (!doppio.isEmpty())
            	{
                	a.adderror('Nome già esistente');
            	}
            }
            
        }
    }
    //esercizio 7 in sospeso!
    public static void editBeforeInUp(List<Account>newAccount)
        {
            Set<Id> ownerid = new Set<Id>();
            for (Account a: newAccount)
            {
                ownerid.add(a.OwnerId);
            }
        }
    public static void checkAfterInsert(List<Account>newAccount)
    {
        
        List<Contact> contatti = new List<Contact>();
        Map<Id,Account> newLista = New Map<Id, Account>([SELECT Id, NumberofLocations__c FROM Account WHERE Id IN :newAccount]);
            for (Account a: newAccount)
            {
                if (newLista.get(a.Id).NumberofLocations__c >0)
                {
                    for (Integer i=0; i<newLista.get(a.Id).NumberofLocations__c; i++)
                    {
                        Contact c = new Contact();
                    	c.LastName = 'LastName Contact '+i ;
                    	c.FirstName = 'FirstName Contact '+i; 
                    	c.AccountId = newLista.get(a.Id).Id;
                    	contatti.add(c);
                    }
                    
                }
            }
        try
        {
            insert contatti;
        }
        catch (DMLException e)
        {
            System.debug('Eccezione '+ e.getMessage());
        }
        
    }
    public static void checkBeforeDelete(List<Account> oldAccounts)
    {
        Map<Id,Account> newLista = New Map<Id, Account>([SELECT Id, (Select id FROM Contacts ) FROM Account WHERE Id IN :oldAccounts]);
            for (Account a: oldAccounts)
            {
                if (newlista.get(a.Id).contacts.size()>2)
                {
                    a.adderror('Error.\n Non puoi eliminare questo account.\nQuesto account è associato a più di 2 contatti');
                }
            }
    }
    public static void sendEmailForActiveAccount(List<Account>newAccounts)
    {
        EmailBatchCancPayment__mdt user_mdt = EmailBatchCancPayment__mdt.getInstance('Config');
        List<User> users = new List<User>([SELECT id, FirstName, LastName, Email FROM User WHERE FirstName =:user_mdt.FirstName__c AND
                           LastName =:user_mdt.Last_Name__c AND Email =:user_mdt.Email__c]);
        for (Account acc: newAccounts)
        {
            if (acc.Active__c.equalsIgnoreCase('Yes'))
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {user_mdt.Email__c};
   				mail.setToAddresses(toAddresses);
                mail.setSubject('L\'Account '+ acc.Name + ' è stato attivato!');
                mail.setPlainTextBody('Test attivazione account');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
    }
}