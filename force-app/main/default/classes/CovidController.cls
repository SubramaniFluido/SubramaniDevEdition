public class CovidController {
    @AuraEnabled
    public static List<satewisedata> CovidData(){
        //State wise data request
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://api.covid19india.org/data.json');
        req.setMethod('GET');
        req.setTimeout(60000);
        HttpResponse res=http.send(req);
        String jsonStateData=res.getBody();
        wrpStateWise StateList =(wrpStateWise)JSON.deserialize(jsonStateData,
                                                               wrpStateWise.class);
        Http http1=new Http();
        HttpRequest req1=new HttpRequest();
        req1.setEndpoint('https://api.covid19india.org/v2/state_district_wise.json');
        req1.setMethod('GET');
        req1.setTimeout(60000);
        HttpResponse res1=http1.send(req1);
        String jsonDistricData=res1.getBody();
        Sates[] DisList =(Sates[])JSON.deserialize(jsonDistricData, Sates[].class);
        for(satewisedata ws: StateList.statewise){
            for(Sates s:DisList){
                if(ws.state == s.state){
                    ws.disData=new List<districdata>();
                    ws.disData.addAll(s.districtData);
                }
            }
        }
        /*for(satewisedata s: StateList.statewise){
        system.debug('state = '+s.state);
        if(s.disData != null) {
        for(districdata d: s.disData){
        system.debug('Distric = '+d.district);
        }
        }
        }*/
        return StateList.statewise;
    }
    //for state wise data process
    public class wrpStateWise{
        @AuraEnabled public satewisedata []statewise {get;set;}
    }
    public class satewisedata{
        @AuraEnabled public String active {get;set;}
        @AuraEnabled public String confirmed {get;set;}
        @AuraEnabled public String deaths {get;set;}
        @AuraEnabled public String deltaconfirmed {get;set;}
        @AuraEnabled public String deltadeaths {get;set;}
        @AuraEnabled public String deltarecovered {get;set;}
        @AuraEnabled public String lastupdatedtime {get;set;}
        @AuraEnabled public String recovered {get;set;}
        @AuraEnabled public String state {get;set;}
        @AuraEnabled public String statecode {get;set;}
        @AuraEnabled public districdata []disData {get;set;}
    }
    //for distric data process
    public class Sates{
        String state;
        districdata []districtData;
    }
    public class districdata{
        @AuraEnabled public String district;
        @AuraEnabled public Integer confirmed;
        @AuraEnabled public String lastupdatedtime;
        @AuraEnabled public deltadata delta;
    }
    public class deltadata{
        @AuraEnabled public Integer confirmed;
    }
}