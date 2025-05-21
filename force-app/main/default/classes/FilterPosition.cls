public class FilterPosition {

    private String q= 'SELECT Name, Functional_Area__c, Min_Pay__c, Max_Pay__c FROM Position__c WHERE Functional_Area__c != null';
    public List<Position__c> getListPos()
    {
        List<Position__c>results = Database.query(q);
        return results;
    }
    public void ListHR()
    {
        this.q = 'SELECT Name, Functional_Area__c, Min_Pay__c, Max_Pay__c FROM Position__c WHERE Functional_Area__c = \'Human Resources\'';
    }
    public void All()
    {
        
    }
    public void ListIT()
    {
        this.q = 'SELECT Name, Functional_Area__c, Min_Pay__c, Max_Pay__c FROM Position__c WHERE Functional_Area__c = \'Information Technology\'';
    }
}