public class ProiezioneHandler {
	public static void checkBeforeInsert(List<Proiezione__c>newlist)
    {
        Set<Id>listf = new Set<Id>();
        for (Proiezione__c pr : newlist)
        {
            listf.add(pr.FestivalFilm__c);
        }
        
        List<Proiezione__c> doppione = [SELECT Data__c, Orario__c, FestivalFilm__c FROM Proiezione__c WHERE FestivalFilm__c IN :listf];
       	
        for (Proiezione__c pro : newlist)
        {
            for (Proiezione__c p : doppione)
            {
                if (p.FestivalFilm__c == pro.FestivalFilm__c && p.Data__c == pro.Data__c && p.Orario__c == pro.Orario__c)
                {
                    pro.addError('Error. Stesso orario e data dello stesso film');
                }
            }
        }
    }
}