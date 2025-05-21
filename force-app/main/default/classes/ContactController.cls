public class ContactController {
    @AuraEnabled
    public static List<Contact> getContacts (Id recordId)
    {
        return [SELECT id, FirstName, LastName, Email, Phone
               FROM Contact
               WHERE AccountId =: recordId];
    }

}