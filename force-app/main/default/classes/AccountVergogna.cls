public class AccountVergogna {
public static void handleAccounts(String nome){
        
        List <Account> lista = [select id, name from account];
        for(Integer i=0;i<lista.size();i++){
            if(lista[i].name==nome){
                Contact c= new Contact();
                c.LastName='A caso'+i;
                c.AccountId=lista[i].id;
                List<Contact> conts = [Select id, accountid, lastname from contact];
                for(Integer j=0;j<conts.size();j++){
                    if(conts[j].lastname==c.lastname&&conts[j].accountid==c.AccountId){
                        System.debug('error');
                    }else{
                        insert c;
                    }
                }
            }else{
                Account a = new Account(name=nome);
                insert a;
            }
        }
        
    }
}