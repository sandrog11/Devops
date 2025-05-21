public with sharing class styleDataTableController {
    @AuraEnabled (cacheable=true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT id, Name, AnnualRevenue, Industry, Phone
            FROM Account
            WHERE AnnualRevenue != NULL
            LIMIT 10 ];
        } catch (DmlException e) {
            throw new DmlException(e.getMessage());
        }
    }
}