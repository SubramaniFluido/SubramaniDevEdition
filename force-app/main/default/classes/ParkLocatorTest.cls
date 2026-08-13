@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String con = 'Germany';
        String[] result = ParkLocator.country(con);
        System.debug('@@'+result);
        // Verify that a fake result is returned
        //System.assertEquals(, result); 
    }
}