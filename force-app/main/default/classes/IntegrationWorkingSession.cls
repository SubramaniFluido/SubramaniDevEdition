public class IntegrationWorkingSession {
    
    public static HttpResponse getCovidCasesInfo() {
        //1. Prepare HttpRequest and wrap data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            List<CovidWrapper> wrappers = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
            CovidWrapper wrapper = wrappers[0];
        }
        return response;
    }

    public static HttpResponse postPosts() {
        //1. Prepare HttpRequest and wrap data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');

        //1.1 prepare body
        Case cases = [SELECT CaseNumber, Description, Subject FROM case WHERE CreatedDate = TODAY LIMIT 1];
        PostWrapper post = new PostWrapper();
        post.user_id = Integer.valueOf(cases.CaseNumber);
        post.title = cases.Description;
        post.body = cases.Subject;
        request.setBody(JSON.serialize(post));
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer 2b07245d6b4e6cd200bd59a11a06dec80aeb984bf05dc9036fa036c6ba9e3a56');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 201) {
            System.debug(response.getBody());
        } else {
            System.debug('An error occurred while sending post!');
        }
        return response;
    }
    
    public with sharing class CovidWrapper {
        public Integer states;
        public Integer positive;
        public Integer negative;
        public Integer pending;
	}
    
    public with sharing class PostWrapper {
        public Integer user_id;
        public String title;
        public String body;
	}


}