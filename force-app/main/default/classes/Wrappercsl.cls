public class Wrappercsl {
    
    public static void method1(){
        List<WrapperClas> wrList = new List<WrapperClas>();
		WrapperClas wrobj = new WrapperClas('sub', 12);
        wrList.add(wrobj);
        WrapperClas wrobj1 = new WrapperClas('Kan', 1);
        wrList.add(wrobj1);
        for(WrapperClas wr: wrList){
            
            system.debug('wraper'+wr.studentname);
        }
    }
    
    public class WrapperClas{
        string studentname;
        Integer rank;
        
        public WrapperClas(String s, integer r){
            this.studentname= s;
            this.rank= r;
            
        }
        
    }
    
    public class CovidCountries{
        Public String Country;
        Public String CountryCode;
        Public String Slug;
        Public String NewConfirmed;
        Public String TotalConfirmed;
        Public String NewDeaths;
        Public String TotalDeaths;
        Public String NewRecovered;
        Public String TotalRecovered;        
        
    }
    
    public static void restApi(){
        List<CovidCountries> covidList = new List<CovidCountries>();
        http ht= new http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://api.covid19api.com/summary');
        req.setMethod('GET');
        HttpResponse response = ht.send(req);
        System.debug('Response '+response.getBody());
        
        
        JSONParser parser= JSON.createParser(response.getBody());
        
        while(parser.nextToken()!=NULL){
            system.debug('inside 1st if');
            if(parser.getCurrentToken() == JSONTOKEN.START_ARRAY){
                while(parser.nextToken()!=null){
                    if(parser.getCurrentToken() == JSONTOKEN.START_OBJECT){
                     CovidCountries covid = (CovidCountries)parser.readValueAs(CovidCountries.class);
                        if(String.isNotBlank(covid.country)){
                            covidList.add(covid);
                        }
                	}
                }
            }
        }
        
        for(CovidCountries cL: covidList){
            system.debug('Country name'+cL.Country);
        }
    }

}