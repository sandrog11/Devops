public class CreateEditAccount {
    public Account account {get; private set;}
    //shortcut per implementare il get e il set
    
    public CreateEditAccount()
    {
        Id id = ApexPages.currentPage().getParameters().get('id'); //si recupera id se presente
        account = (id==null)? new Account() : [SELECT name, phone, industry FROM Account where Id =:id];
        //operatore ternario, se è presente l'id, allora recupera l'account per l'id della query e lo associa
        //ad una variabile, altrimenti crea nuovo Account
    }
    public PageReference save()
    {
        try
        {
            upsert(account);
        }
        catch(DMLException e)
        {
            ApexPages.addMessages(e);
            return null;
        }
        
        PageReference accountCreato = new ApexPages.StandardController(account).view();
        return accountCreato;
    }
}