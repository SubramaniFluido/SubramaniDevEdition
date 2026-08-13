global with sharing class IntegrationSOAPApexWebservice {
    /*
    Information about SOAP Request
    /services/apexrest/class/namespace/v1/AccountManager
    
    /services/Soap/class/namespace/classname - Where in Soap word S will always be in Capital
    
    Content-Type: text/xml; charset=UTF-8;
    Accept: text/xml;
    SOAPAction: '';
        
    <?xml version="1.0" encoding="UTF-8"?>
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:amit="http://soap.sforce.com/schemas/class/IntegrationSOAPApexWebservice">
    <soapenv:Header>
      <amit:SessionHeader>
         <amit:sessionId>00D6F000000E7o8!AQ0AQFX6h4xLsWn08OKsFoNlf7USVj9bN3pbxVCg9i22fG2OEwT9rRfN.3Y4LE8u9rthh_ZpX.sU_wWub6GT0PVAwtX3v3a1</amit:sessionId>
      </amit:SessionHeader>
    </soapenv:Header>
    <soapenv:Body>
      <amit:createAccount>
         <amit:accRec>
            <amit:Name>WebService Account</amit:Name>
            <amit:Rating>Hot</amit:Rating>
            <amit:Industry>Education</amit:Industry>
            <amit:Phone>9999999999</amit:Phone>
            <amit:AccountNumber>HJHJDUI34</amit:AccountNumber>
            <amit:LastName>WebService Contact L</amit:LastName>
         </amit:accRec>
      </amit:createAccount>
    </soapenv:Body>
    </soapenv:Envelope>
    
*/

/*
    //tRY THIS FROM OTHER SYSTEM 
    IntegrationSOAPApexWeb.IntegrationSOAPApexWebservice serviceClass= new IntegrationSOAPApexWeb.IntegrationSOAPApexWebservice();
    IntegrationSOAPApexWeb.SessionHeader_element sessionHead= new IntegrationSOAPApexWeb.SessionHeader_element();
    // get session ID of the receiver org (subramani personal org gct)
    sessionHead.sessionId= '00D6F000000E7o8!AQ0AQMF9.ZEClHQmVMGR929qtHk3OYr3SxR84h0rD6lgaT_oJ2q5nX3HUypxjFmo640214HlgNta2COpyHc2RaKwrekzjie1';

    serviceClass.SessionHeader= sessionHead;

    IntegrationSOAPApexWeb.AccountWrapper wrapper= new IntegrationSOAPApexWeb.AccountWrapper();
    wrapper.AccountNumber= 'WSDL-2021';
    wrapper.Name='WSDL-12';
    wrapper.Rating='Hot';
    wrapper.Industry='Education';
    wrapper.Phone='0987654321';
    wrapper.LastName= 'Partner';

    serviceClass.createAccount(wrapper);
*/
    webservice static String fullName(String firstName, String LastName) {
        return 'WELCOME '+firstName+ ' '+LastName;
    }

    webservice static AccountWrapper createAccount(AccountWrapper accRec) {
        Account acc= new Account();
        acc.Name= accRec.Name;
        acc.Rating= accRec.Rating;
        acc.Industry= accRec.Industry;
        acc.Phone= accRec.Phone;
        acc.AccountNumber= accRec.AccountNumber;
        insert acc;
        Contact con= new Contact();
        con.LastName= accRec.LastName;
        con.AccountId= acc.Id;
        insert con;
        return accRec;
    }

    global class AccountWrapper{
        webservice String Name;
        webservice String Rating;
        webservice String Industry;
        webservice String Phone;
        webservice String AccountNumber;
        webservice String LastName;
    }
}