//esercitazione Apex DML
public class AccountController {
    //metodo inserimento account che controlla se già esiste un account con lo stesso nome.
	public String createAccount(String newName)
    {
        String message='';
        List<Account> a = [SELECT Name FROM Account WHERE Name = :newName];
            if (a.isEmpty())
        {
            try{
                Account acc = new Account();
                acc.Name = newName;
                insert acc;
                message='Inserimento avvenuto correttamente';
                System.debug(message);
                    return message;
                
            }
            catch (DMLException e)
            {
                System.debug('Eccezione di tipo: '+ e.getMessage());
            }
        }
        else
        {
            message='Inserimento NON avvenuto.\tEsiste un contatto con lo stesso nome.';
                System.debug(message);
                    
        }
        return message;
    }
    //metodo che verifica se esiste un account col nome in ingresso
    public Account retrieveAccountByName(String Name)
    {
        List<Account> acc = [SELECT Name FROM Account WHERE Name = :Name];
        if (acc.isEmpty()==false)
        {
            Account a = [SELECT Name FROM Account WHERE Name = :Name];
            System.debug('Result of query is: '+ JSON.serialize(a));
            return a;
            
        }
        else 
        {
            System.debug('Nessun Account presente con questo nome');
            return null;
        }
    }
    public String createOpportunity(String newnameOpportunity, String newStagename, Account acc, Date data)
    {
        String message='';
        List<Opportunity> dopp = [SELECT Name, StageName FROM Opportunity WHERE Name = :newnameOpportunity OR StageName=:newStageName];
    	if (dopp.isEmpty())
        {
            List<Opportunity> opp = [SELECT id FROM Opportunity WHERE AccountId = :acc.Id];
            if (opp.isEmpty())
            {
                    try{
                    Opportunity newOpp= new Opportunity();
                    newOpp.Name = newnameOpportunity;
                        newOpp.StageName = newStagename;
                        newOpp.AccountId = acc.Id;
                        newOpp.CloseDate = data;
                    insert newOpp;
                    message='Inserimento avvenuto correttamente dell\'Opportunity';
                    System.debug(message);
                    return message;
                    
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
                return message;
            }
            else 
            {
                message='Opportunity associata già ad un altro Account!';
                 System.debug(message);
            	return message;
            }
        }
        else
        {
            message='Doppione! Opportunity già esistente.';
             System.debug(message);
            return message;
        }
    }
    
    public String updateAccountName(String NameAccount, String newNameAccount)
    {
        String message='';
        List<Account> acc = [SELECT Name FROM Account WHERE Name = :NameAccount];
        if (acc.isEmpty()==false)
        {
            List<Account> newacc = [SELECT Name FROM Account WHERE Name = :newNameAccount];
            if (newacc.isEmpty())
            {
                try{
                Account nuovo = [Select Name
                                From Account
                                Where Name = :NameAccount];
                nuovo.Name = newNameAccount;
                update nuovo;
                    message='Nome Account cambiato correttamente.';
                    System.debug(message);
                    return message;
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
                return message;
            }
            else
            {
                message = 'Nome già presente';
                System.debug(message);
                return message;
            }
        }
        else
        {
            message = 'Nessun Account presente con questo nome';
            System.debug(message);
            return message;
        }
    }
    
    public String updateOpportunityStage(String NameOpp, String newNameOpp, Account acc)
    {
        String message='';
        List<Opportunity> opp = [SELECT id FROM Opportunity WHERE AccountId = :acc.Id AND Name= :NameOpp];
        if (opp.isEmpty())
        {
            message='Questa Opportunity non è associata a nessun account';
        	System.debug(message);
            return message;
        }
        else
        {
            List<Opportunity> newopp = [SELECT Name FROM Opportunity WHERE AccountId = :acc.Id AND Name= :newNameOpp];
        	if (newopp.isEmpty())
            {
                try{
                Opportunity nuova = [Select Name
                                From Opportunity
                                Where Name = :NameOpp];
                nuova.Name = newNameOpp;
                update nuova;
                    message='Nome Opportunity cambiato correttamente.';
                    System.debug(message);
                    return message;
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
                return message;
            }
            else
            {
                message ='Nome già presente';
                System.debug(message);
                return message;
            }
        }
    }
    
    public void deleteOpportunity(Account a)
    {
        List<Opportunity>opp = [SELECT id 
                               FROM Opportunity
                               WHERE AccountId= :a.Id];
        if (opp.isEmpty())
        {
            System.debug('Nessuna opportunity associata a questo account');
        }
        else
        {
            try{
                	delete opp;
                    System.debug('Opportunity eliminata correttamente');
                   
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
        }
    }
    
    public void deleteAccount(String NomeAccount)
    {
        List<Account> acc= [SELECT (Select name FROM Opportunities) FROM Account Where name = :NomeAccount];
        if (acc.isEmpty())
        {
            try{
                	delete acc;
                    System.debug('Account eliminato correttamente senza cancellare opportunities');
                   
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
        }
        else
        {
            Account a= [SELECT (Select name FROM Opportunities) FROM Account Where name = :NomeAccount];
            deleteOpportunity(a);
            try{
                	delete acc;
                    System.debug('Account eliminato correttamente cancellando opportunities');
                   
                }
                catch (DMLException e)
                {
                    System.debug('Eccezione di tipo: '+ e.getMessage());
                }
        }
    }
    
    @AuraEnabled
    public static List <Account> getAccountsList()
    {
        return [SELECT id, Name
               FROM Account
               limit 5];
    }
    
    
    
}