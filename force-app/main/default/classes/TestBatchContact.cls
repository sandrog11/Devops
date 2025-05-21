public class TestBatchContact implements Database.Batchable<sObject>{
	public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select id, lastname from Contact');
    }
    public void execute(Database.BatchableContext bc, List<Contact>listafromStart)
    {
        for (Contact c : listafromStart)
        {
            c.lastName = 'Da Batch Ancora '+ c.lastName;
        }
        update listafromStart;
    }
    public void finish(Database.BatchableContext bc)
    {
       TestDemoBatch tdb = new TestDemoBatch();
        Database.executeBatch(tdb);
    }
}