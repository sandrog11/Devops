public class StringArrayTest {
	public static List<String> generateStringArray(Integer n)
    {
        List<String> lista = new List<String>();
        for (Integer i=0; i<n; i++)
        {
            lista.add('Test' + i);
            System.debug(lista.get(i));
        }
        return lista;
    }
    
}