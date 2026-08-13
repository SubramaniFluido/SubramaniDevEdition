@isTest
public class AnimalLocatorTest {
    static testMethod void testPostCallout() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String actualValue = AnimalLocator.getAnimalNameById(1);
    // Verify that the response received contains fake values
	}

}

//curl -v https://login.salesforce.com/services/oauth2/token -d "grant_type=password" -d "client_id=3MVG9YDQS5WtC11q5SL2n.Yq6XIPWa_zACLY3.IKg5.OydUDkg59xqf0ewE1F9ueibLxw74jjgOlUQLAajOVg" -d "client_secret=98AA2657575FED984B6A37B8B57FF33B973D5A526324D43FDAD0C05CF57EB1DA" -d "username=subramanigct@gmail.com" -d "password=salesforce@3NMvCiJlt9mX5OdunQks6fV9qs" -H 'X-PrettyPrint:1'
//curl https://subramani-kumarasamy-dev-ed.my.salesforce.com/services/apexrest/Cases/5006F00002Bt96pQAB -H 'Authorization: Bearer 00D6F000000E7o8!AQ0AQAx3wIYjK7z7bKUVoe3DqF.3avAAVVrIGLGKFm7JeLANMOQ3M_tEB9yOT7HVhCtDBPcTHoOmjaPCFac_hubQjwfpDPyY' -H 'X-PrettyPrint:1'