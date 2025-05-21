public class ListContact {
	@AuraEnabled
    public static List<Contact> getListContacts()
    {
        return [SELECT id, name FROM Contact limit 10];
    }
    @AuraEnabled
    public static List<Contact> getListFiltered(String nome)
    {
        String nomeContact = '%'+ nome +'%';
        List<Contact> clist = [SELECT id, name FROM Contact WHERE Name LIKE :nomeContact limit 10];
        return clist;
    }
    @AuraEnabled
    public static Contact getContact(Id recordId)
    {
        return [SELECT id, name, Title, Phone, Email, Account.Name
               FROM Contact
               WHERE id =: recordId];
    }
}