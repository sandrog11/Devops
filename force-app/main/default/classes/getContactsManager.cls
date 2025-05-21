public with sharing class getContactsManager {
    //constructor
    /*public getContactsManager() {

    }*/
    @AuraEnabled (cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT id, name, Account.Name, FirstName, LastName
        FROM Contact
        WHERE Account.Name != null limit 10];
    }
    @AuraEnabled (cacheable=true)
    public static List<Account> getAllAccounts(){
    return [SELECT Id, Name
            FROM Account LIMIT 5];
    }

    @AuraEnabled (cacheable=true)
    public static List<Contact> getContactsByAccount(Id accountId){
        if(String.isNotBlank(accountId))
        {
            return [SELECT id, name, Account.Name, FirstName, LastName
            FROM Contact
            WHERE AccountId  =:accountId];
        }
        else {
            return null;
        }
    }
}