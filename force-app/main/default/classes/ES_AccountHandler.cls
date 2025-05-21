public class ES_AccountHandler {
    public static void checkBeforeInsert(List<Account>newAccount)
    {
        for (Account accs : newAccount)
        {
            if ((accs.Industry == null) && (accs.Type == null))
            {
                accs.addError('Non puoi aggiungere questo Account\nCompleta i campi \'Industry e Type\'');
            }
        }
    }
    public static void checkBeforeUpdate(List<Account>newAccount)
    {
        for (Account acc:newAccount)
        {
            if (acc.Rating == null)
            {
                acc.Rating = 'Warm';
            }
        }
    }

}