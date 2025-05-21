public class RetrievePosition {
	/*@AuraEnabled
    public static Position__c getPosition(Id recordId)
    {
        Position__c pos = [SELECT Id, name, Open_Date__c, Min_Pay__c, Max_Pay__c FROM Position__c WHERE Id = :recordId];
        return pos;
    }
    @AuraEnabled
    public static void setPosition(Position__c position)
    {
        
        update position;
    }*/
    @AuraEnabled
    public static Id insertPosition(Position__c position)
    {
        insert position;
        //system.debug(position);
        return position.Id;
    }
}