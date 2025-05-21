public class RetrieveClient {
	@AuraEnabled
    public static Id insertClient(Contact contact)
    {
        insert contact;
        return contact.id;
    }
}