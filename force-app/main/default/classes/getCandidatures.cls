public class getCandidatures 
{
    public List<Job_Application__c> getListcand()
    {
    List<Job_Application__c> cand = [SELECT id, Position__r.Name, Candidate__r.First_Name__c, Candidate__r.Last_Name__c FROM Job_Application__c ORDER BY Position__r.Name];
    return cand;
    }
}