public class RetrieveListClients {
    @AuraEnabled
    public static List<Contact> getClientList(Id recordId)
    {
        List<Contact> lista = [SELECT id, Name, FirstName, LastName, Email, Phone FROM Contact WHERE OwnerId = :recordId];
        return lista;
    }

}