public class ParkLocator {
    public static List<String> country(String country){
        ParkService.ParksImplPort parkservice = 
            new parkService.ParksImplPort();
        return parkservice.byCountry(country);
    }

}
