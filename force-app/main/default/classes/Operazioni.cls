//Questa classe mi permette di calcolare le 4 operazioni elementari con l'ausilio di 4 metodi differenti
public class Operazioni {
    //calcolo la somma di due valori in ingresso
	public Integer sum(Integer n1, Integer n2)
    {
        Integer sum=0;
        sum = n1+n2;
        System.debug('La somma tra '+n1+ ' e '+ n2+ ' è uguale a '+ sum);
        return sum;
    }
    //calcolo la differenza di due valori in ingresso
	public Integer subtraction(Integer n1, Integer n2)
    {
        Integer subtraction=0;
        subtraction = n1-n2;
        System.debug('La differenza tra '+n1+ ' e '+ n2+ ' è uguale a '+ subtraction);
        return subtraction;
    }
    //calcolo il prodotto di due valori in ingresso
    public Integer moltiplication(Integer n1, Integer n2)
    {
        Integer moltiplication=0;
        moltiplication = n1*n2;
        System.debug('Il prodotto tra '+n1+ ' e '+ n2+ ' è uguale a '+ moltiplication);
        return moltiplication;
    }
    
    //calcolo il quoziente di due valori in ingresso
    public Integer division(Integer n1, Integer n2)
    {
        Integer division=0;
        division = n1/n2;
        System.debug('Il quoziente tra '+n1+ ' e '+ n2+ ' è uguale a '+ division);
        return division;
    }
}