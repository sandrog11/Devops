public class ViewPagella {
    @AuraEnabled
	public static Pagella__c getPagella (Id pagellaid)
    {
        List<Pagella__c> pg = [SELECT id, Nome_Alunno__c, Voto__c FROM Pagella__c WHERE id = :pagellaid];
        if (!pg.isEmpty())
        {
            system.debug(pg);
            return pg.get(0);
        }
        else
            return null;
    }
}