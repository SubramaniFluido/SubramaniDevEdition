public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        system.debug('hehe'+cs);
        return cs.setScale(2);
    }
    
    public static Decimal Addition(Decimal no1, decimal no2) {
        Decimal cs = no1 + no2;
        system.debug('hehe'+cs);
        return cs.setScale(2);
    }
}