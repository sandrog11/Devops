/*In lista mi faccio ritornare tutti gli account presenti facendo una semplice query.
effettuo un controllo per vedere se nella lista sono presenti account col nome in ingresso
se sono presenti account con il nome inserito;
creo dei nuovi Contact associati all'account
e popolo i due campi LastName e AccountId 

In una lista mi faccio ritornare tutti i Contact
scorro la lista e se ci sono LastName e AccountId uguali a quelli 
precedemente inseriti stampo 'error'
altrimenti i contatti vengono salvati nel DB.

In ultima ipotesi creo un nuovo Account col nome inserito dall'utente.*/
public class AccountNuovo {
    public static void handleAccounts(String nome){
        Contact c= new Contact();
        //mediante lista verifico se ci sono account con lo stesso nome in ingresso
	List <Account> lista = [select id, name from account where name=:nome limit 1];
        //se la lista è vuota vuol dire che non esiste nessun account con quel nome, allora creo un nuovo Account con quel nome
        if (lista.isEmpty())
        {
            Account acc = new Account(Name= nome);
            insert acc;
            System.debug('Inserimento Account avvenuto correttamente');
            c.LastName='A caso';
            c.AccountId=acc.id;
        }
        //Se la lista non è vuota vuol dire che esiste un account con quel nome e allora creo dei nuovi contatti
        else
        {
            for(Integer i=0;i<lista.size();i++){
                c.LastName='A caso'+i;
                c.AccountId=lista[i].id;
        	}
		}
        //mediante una lista verifico che non ci siano già presenti contatti nel DB uguali (LastName e accountId) a quelli che 
        //ho creato precedentemente.
        List<Contact> conts = [Select id, accountid, lastname from contact where lastname=:c.LastName AND accountid =:c.AccountId];
    	//Se la lista è vuota vuol dire che non ci sono contatti con quel lastName e accountId allora li salvo nel db
        if (conts.isEmpty())
        {
            //inserisco il nuovo contact
            insert c;
            System.debug('Inserimento contatto avvenuto correttamente');
        }
        else
        {
            system.debug('error');
        }
    }
}