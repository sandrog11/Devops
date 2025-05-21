public class RetrieveDetailPosition {
@AuraEnabled
    public static Position__c getdetailsPos(Id recordId)
    {
        Position__c pos = [SELECT Id, Name, Open_Date__c, Close_Data__c, Functional_Area__c, Min_Pay__c, Max_Pay__c FROM Position__c
                          WHERE Id = :recordId];
        return pos;
    }
}