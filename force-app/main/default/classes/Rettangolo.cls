//questo snippet mi calcola l'area e il perimetro del rettangolo dando in ingresso base e altezza
public class Rettangolo {
    Double base;
    Double altezza;
    
    //costruttore Rettangolo che prende in ingresso due parametri
    public Rettangolo(Double base, Double altezza)
    {
        this.base = base;
        this.altezza =altezza;
    }
    //metodi getters and setters
    public Double getBase()
    {
        return base;
    }
     public void setBase(Double base) {
        this.base = base;
    }
    public Double getAltezza()
    {
        return altezza;
    }
     public void setAltezza(Double altezza) {
        this.altezza = altezza;
    }
    //calcolo l'area
    public Double getArea()
    {
        Double area = base * altezza;
        System.debug('L\'area del rettangolo è: '+ area );
        return area;
    }
    //calcolo il perimetro
    public Double getPerimetro()
    {
        Double perimetro = 2*(base + altezza);
        System.debug('Il perimetro del rettangolo è: '+ perimetro );
        return perimetro;
    }
    

}