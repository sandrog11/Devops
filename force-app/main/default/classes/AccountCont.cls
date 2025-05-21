public class AccountCont {
    private Integer limite =5;
    
    public List<Account> getAccounts()
    {
        List<Account> results = DATABASE.query('SELECT id, Name, Type, Industry FROM Account limit '+ limite);
        return results;
    }
    
    public void LimitTen()
    {
        this.limite =10;
    }
    public void LimitTwenty()
    {
        this.limite =20;
    }
    public void backToFive()
    {
        this.limite =5;
    }
}