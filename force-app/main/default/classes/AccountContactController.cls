public with sharing class AccountContactController {
    @AuraEnabled (cacheable=true)
    public static List<AccountContactListWrapper> getAllAccountWithContacts(){
        try {
            List<AccountContactListWrapper> accWrapperList = new List<AccountContactListWrapper>();
            List<Account> accList =  [SELECT Id, Name, BillingState, Website, Phone,
            (SELECT Id, FirstName, LastName, Name, Email, MobilePhone
            FROM Contacts)
            FROM Account WHERE Name != null];

            if (!accList.isEmpty())
            {
                for (Account acc : accList)
                {
                    AccountContactListWrapper accWrapper = new AccountContactListWrapper();
                    accWrapper.accRecord = acc;
                    accWrapper.contactList = acc.Contacts;
                    accWrapper.contactCount = acc.Contacts.size();
                    accWrapperList.add(accWrapper);
                }
            }
            return accWrapperList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    //wrapper class with @AuraEnabled and {get;set;} properties to see in LWC 
    public class AccountContactListWrapper{
        //Record Account
        @AuraEnabled
        public Account accRecord{get;set;}
        //list Contact
        @AuraEnabled
        public List<Contact> contactList{get;set;}
        //# contact associati a quell'Account
        @AuraEnabled
        public Integer contactCount{get;set;}
    }
}