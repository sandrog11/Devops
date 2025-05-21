public class DataEventoDetails {
@AuraEnabled
    public static List<Data_Evento__c> getDataEventoDetails(Id recordId)
    {
        List<Data_Evento__c> de = [SELECT Id, Nome__c, Data__c, Orario__c, Luogo__c, Status__c, Posti_Totali_Disponibili__c, Evento__c, Evento__r.Nome_Evento__c
                             FROM Data_Evento__c
                            WHERE Evento__c = :recordId];
        return de;
    }
}