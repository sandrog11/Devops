public class Palindroma {
	public Boolean isPalindroma(String parola)
    {
        String inversa='';
        for (Integer i=parola.length()-1;i>=0;i--)
        {
            inversa += parola.substring(i, i+1); 
        }
        if (parola == inversa)
        {
            return true;
        }
        else 
        {
            return false;
        }
       
    }
}