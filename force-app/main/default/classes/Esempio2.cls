public class Esempio2 {
    public List<Contact> getListCon()
    {
        List<Contact> con = [SELECT id, Name FROM Contact LIMIT 10];
        return con;
    }
    public List<Opportunity> getListOpp()
    {
        List<Opportunity> opp = [SELECT id, Name FROM Opportunity LIMIT 10];
        return opp;
    }
}