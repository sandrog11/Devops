public class RetrieveEventi {
    @AuraEnabled
    public static List<Evento__c> getListEventi()
    {
        List<Evento__c> newlist = [SELECT id, Nome_Evento__c FROM Evento__c];
        return newlist;
    }

}