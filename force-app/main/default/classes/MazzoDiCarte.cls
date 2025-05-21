public class MazzoDiCarte {
    private Integer valore;
    private Integer seme;
    
	public MazzoDiCarte()
    {
			 
    }
    public String getSeme()
    {
        switch on seme {
            when 1{
                return 'Bastoni';
            }
            when 2{
                return 'Coppe';
            }
            when 3{
                return 'Denari';
            }
            when else{
                return 'Spade';
            }
        }
    }
    public String getValore()
    {
        switch on valore {
            when 1{
                return 'Asso';
            }
            when 2{
                return 'Due';
            }
            when 3{
                return 'Tre';
            }
            when 4{
                return 'Quattro';
            }
            when 5{
                return 'Cinque';
            }
            when 6{
                return 'Sei';
            }
            when 7{
                return 'Sette';
            }
            when 8{
                return 'Donna';
            }
            when 9{
                return 'Cavallo';
            }
            when else{
                return 'Re';
            }
        }
    }
}