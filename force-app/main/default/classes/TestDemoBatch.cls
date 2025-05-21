public class TestDemoBatch implements Database.Batchable<sObject>
{
	public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select id, name from Account');
    }
    public void execute(Database.BatchableContext bc, List<Account>listafromStart)
    {
        for (Account acc : listafromStart)
        {
            acc.name = 'Da Batch Ancora '+ acc.Name;
        }
        update listafromStart;
    }
    public void finish(Database.BatchableContext bc)
    {
        System.debug('TT appò');
    }
}