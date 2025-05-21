public class getPositions {
    public List<Position__c> getlistapos()
    {
        List<Position__c> pos = [SELECT Name, Functional_Area__c, Type__c FROM Position__C];
        return pos;
    }
}