public class ParkLocator {
    
    public static String[] country(	String count) {
        ParkService.ParksImplPort coun = new ParkService.ParksImplPort();
        return coun.byCountry(count);
    }
}