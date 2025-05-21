public class RetrieveStudent {
   /* @AuraEnabled
	public static Studente__c getStudente(ID recordId)
    {
        Studente__c st = [SELECT Id, Nome__c, Cognome__c, Codice_Fiscale__c FROM Studente__c WHERE Id =:recordId];
        return st;
    }
    
    @AuraEnabled
    public static void setStudente(Studente__c studente)
    {
        update studente;
    }*/
    @AuraEnabled
    public static Id insertStudente(Studente__c studente)
    {
        insert studente;
        return studente.id;
    }
}