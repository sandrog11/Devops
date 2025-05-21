public class BatchPaymentScaduti implements Database.Batchable<sObject>, Database.Stateful{
	public String query = '';
    public String queryHelperName = 'DeletePaymentByFilters';
    //public String queryHelperNameTEST = 'ActivationOrderBatch_TestClass';
    public String data, stackTrace;
    public Long numeroAccountsDaCancellare = 0;
    
    public BatchPaymentScaduti(){
        queryHelper__mdt queryHelper = queryHelper__mdt.getInstance(queryHelperName);
        this.query = queryHelper.query__c;
        system.debug('format data is: '+ queryHelper.Data__c);
		data = String.valueOf(queryHelper.Data__c);        
        this.query = this.query.replace('Data', data+'T00:00:00Z');
        
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('query is: '+ query);
      return Database.getQueryLocator(query);
   }

    public void execute(Database.BatchableContext BC, List<sObject> scope){
        try {
   			List<Account> accountsDaCancellare = new List<Account>();
			for(sObject accountDaCancellare : scope){
    			accountsDaCancellare.add((Account) accountDaCancellare);
        	}
       	 	System.debug('Size CodiciDaCancellare: ' + accountsDaCancellare.size()); 
       	 	numeroAccountsDaCancellare += accountsDaCancellare.size();
            try {
                delete accountsDaCancellare; 
            } catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }

			//DataBase.emptyRecycleBin(accountsDaCancellare);
   		} catch (Exception ex) {
   			stackTrace = ex.getStackTraceString();
   		}
        system.debug('result query is:' + scope);
       }

   public void finish(Database.BatchableContext BC){
       AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :BC.getJobId()];
   		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   		EmailBatchCancPayment__mdt cs =  EmailBatchCancPayment__mdt.getInstance('Config');
   		String[] toAddresses = new String[] {cs.Email__c};
   		mail.setToAddresses(toAddresses);
  		mail.setSubject('Batch BatchAccountScaduti ' + a.Status);
  		if(!String.isBlank(stackTrace)){
   			mail.setPlainTextBody
   			('Stack Trace ' + stackTrace);
   		} else {
   			mail.setPlainTextBody
   			('Il batch Apex ha cancellato ' + numeroAccountsDaCancellare +
   			' codici promozionali con '+ a.NumberOfErrors + ' errori.');
  		} 
   		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   }
}