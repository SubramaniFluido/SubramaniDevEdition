public class MadCatCallout {
    public static void GetMadCatCallout() {
   
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.madmimi.com/audience_lists/lists.xml?username=rodeon22@hotmail.com&api_key=aeacf64a532f688faa76aa07836cc74c');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            String xmlResponse = response.getBody();
            Dom.Document doc = new Dom.Document();
            doc.load(xmlResponse);
            Dom.XmlNode listsNode = doc.getRootElement();
            for(Dom.XmlNode listNode : listsNode.getChildElements()) {
                String id = listNode.getAttribute('id', null);
                String name = listNode.getAttribute('name', null);
                Integer subscriberCount = Integer.valueOf(listNode.getAttribute('subscriber_count', null));
                String displayName = listNode.getAttribute('display_name', null);
            }
        }
    }
}