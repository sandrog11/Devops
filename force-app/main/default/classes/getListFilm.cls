public class getListFilm {
    public List<FestivalFilm__c> getListFilm()
    {
        List<FestivalFilm__c>results = Database.query('SELECT Name, Regista__c, Anno__c FROM FestivalFilm__c WHERE Anno__c > \'2005\'');
        return results;
    }
}