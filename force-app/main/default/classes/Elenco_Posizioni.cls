public class Elenco_Posizioni {
	@AuraEnabled
    public static List<Position__c> getListPos()
    {
        system.debug([SELECT id, Name, Functional_Area__c, Min_Pay__c, Max_Pay__c, Type__c, Close_Data__c FROM Position__c WHERE Close_Data__c > TODAY ]);
        return [SELECT id, Name, Functional_Area__c, Min_Pay__c, Max_Pay__c, Type__c, Close_Data__c FROM Position__c WHERE Close_Data__c > TODAY ];
    }
    
    @AuraEnabled
    public static List<Position__c> getListPosFiltro(String area, String tipo)
    {
        String farea = '%'+ area +'%';
        String ftipo = '%'+ tipo +'%';
        return [SELECT id, Name, Functional_Area__c, Min_Pay__c, Max_Pay__c, Type__c, Close_Data__c FROM Position__c WHERE Functional_Area__c LIKE :farea AND Type__c LIKE :ftipo AND Close_Data__c > TODAY ];
    }
    @AuraEnabled
    public static List<Candidate__c> getCandidatesForPositions(String positionId)
    {
        return [SELECT id, First_Name__c, Last_Name__c, Email__c, Phone__c, Address_Candidate__c FROM Candidate__c WHERE id in (SELECT Candidate__c FROM Job_Application__c WHERE Position__c =:positionId)];
    }
    @AuraEnabled
    public static List<Employment_Websites__c> getWebsitesForPosition(String positionId)
    {
        return [SELECT id, Name FROM Employment_Websites__c WHERE id in (SELECT Employment_Websites__c FROM Job_Posting__c WHERE Position__c =:positionId)];
    }
    @AuraEnabled
    public static Candidate__c getCandidate(String candidateId)
    {
        system.debug([SELECT id, First_Name__c, Last_Name__c, Email__c, Phone__c, Address_Candidate__c FROM Candidate__c WHERE id =:candidateId]);
        return [SELECT id, First_Name__c, Last_Name__c, Email__c, Phone__c, Address_Candidate__c FROM Candidate__c WHERE id =:candidateId];
    }
    @AuraEnabled
    public static Employment_Websites__c getWebsites(String websiteId)
    {
        return [SELECT id, Name, Web_Site__c, Price_per_Post__c, Number_of_Annunci__c, Totale_Entrate__c FROM Employment_Websites__c WHERE id =:websiteId];
    }

}