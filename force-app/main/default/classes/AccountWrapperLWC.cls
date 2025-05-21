public with sharing class AccountWrapperLWC {
    @AuraEnabled(cacheable=true)
    public static List<AccountWrapper> fetchAccountsDetails(){
        try {
            List<AccountWrapper> accWrapperList = new List<AccountWrapper>();
            List<Account> accList = [
                SELECT Id, Name, Type, (SELECT id FROM Cases), (SELECT id FROM Contacts), (SELECT id FROM Opportunities)
                FROM Account ORDER BY Name
            ];

            for (Account acc : accList)
            {
                AccountWrapper accwrapper = new AccountWrapper();
                accwrapper.accName = acc.Name;
                accwrapper.accType = acc.Type;
                accwrapper.totalCases = acc.Cases.size();
                accwrapper.totalContacts = acc.Contacts.size();
                accwrapper.totalOpportunities = acc.Opportunities.size();
                accWrapperList.add(accwrapper);
            }
            return accWrapperList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public class AccountWrapper{
        @AuraEnabled
        public String accName;
        @AuraEnabled
        public String accType;
        @AuraEnabled
        public Integer totalCases;
        @AuraEnabled
        public Integer totalContacts;
        @AuraEnabled
        public Integer totalOpportunities;
    }
}