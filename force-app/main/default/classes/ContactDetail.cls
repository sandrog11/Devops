public class ContactDetail {
	@AuraEnabled
    public static Contact getContactDetail(Id recordId)
    {
        return [SELECT id, Name, Title, Email, Phone, Account.Name FROM Contact WHERE id = :recordId];
    }
}