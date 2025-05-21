@isTest
public class TemperatureConverterTest {
    //testo il metodo di conversione Celsius Fahrenheit
    //test temperatura calda
	@isTest static void testWarmTemp()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11, celsius);
    }
    
    //testo la casistica in cui il valore in input è 32 in Fahrenheit
    //temperatura di congelamento
    @isTest static void testFreezingPoint()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0, celsius);
    }
    
    //temperatura di ebollizione
    @isTest static void testBoilingPoint()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        System.assertEquals(100, celsius,'Boiling point temperature is not expected.');
    }
    //temperatura negativa
    @isTest static void testNegativeTemp()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33, celsius);
    }
    
    
}