public class RetrieveDetailClient {
	@AuraEnabled
    public static Contact getdetailsClient(Id recordId)
    {
        Contact cliente = [SELECT Id, FirstName, LastName, Email, Phone, Quantita_biglietti_acquistati__c, Somma_spesa__c FROM Contact WHERE Id = :recordId];
        return cliente;
    }
    
}