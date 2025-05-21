public class ContractHandler {
	public static void checkBeforeInsert(List<Contract>newCon)
    {
        Set<Id> idacc = new Set<Id>();
        for (Contract con : newCon)
        {
            idacc.add(con.AccountId);
        }
        
        Map<Id, Account> newMap = new Map<Id, Account>([SELECT Id, Name, (SELECT id FROM Contacts), (SELECT CustomerSignedId FROM Contracts) from Account WHERE Id IN :idacc]);
        for (Contract c : newCon)
        {
            if ((newMap.get(c.AccountId).Contacts.size()>0) && (newMap.get(c.AccountId).Contracts.size()==0))
            {
                for (Contact ct : newMap.get(c.AccountId).Contacts)
                {
                    c.CustomerSignedId = ct.Id;
                }
            }
        }
    }
}