public with sharing class LeadProcessor implements Database.Batchable<SObject>{
    public LeadProcessor() {

    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT ID, LeadSource '+
            'FROM Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> listToUpdate = new List<Lead>();
        for (Lead lead : scope)
        {
            lead.LeadSource = 'Dreamforce';
            listToUpdate.add(lead);
        }
        update listToUpdate;
    }

    public void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        //EmailUtils.sendMessage(job, recordsProcessed);
    }
}