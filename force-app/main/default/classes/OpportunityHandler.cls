public class OpportunityHandler {
	public static void checkBeforeInsert(List<Opportunity>newOpp)
    {
        Set<Id> opp = new Set<Id>();
        for (Opportunity o : newOpp)
        {
            opp.add(o.accountid);
        }
        Map<Id, Account> newmap = new Map<Id, Account>([SELECT id, Active__c FROM Account WHERE id IN :opp]);
        for (Account a : newmap.values())
        {
            if (a.Active__c == 'No')
            {
                a.Active__c = 'Yes';
            }
        }
        update newmap.values();
    }
}