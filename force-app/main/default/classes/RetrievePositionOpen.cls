public class RetrievePositionOpen {
    @AuraEnabled
	public static List<Position__c> getPosList()
    {
        List<Position__c> lista = [SELECT id, Name, Close_Data__c FROM Position__c WHERE Close_Data__c > TODAY];
        system.debug(lista);
        return lista;
    }
}