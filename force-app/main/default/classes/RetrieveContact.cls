public class RetrieveContact {
    @AuraEnabled
	public static List<Contact> getContact (Id recordId)
    {
        List<Contact> contact = [SELECT FirstName, LastName, Phone, Email, AccountId FROM Contact WHERE AccountId =:recordId];
        return contact;
    }
}