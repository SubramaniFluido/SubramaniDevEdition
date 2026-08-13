/**
 * @description       :
 * @author            : Subramani Kumarasamy
 * @group             :
 * @last modified on  : 10-18-2024
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class EntitlementController {
    @AuraEnabled(cacheable=false)
    public static List<Entitlement> fetchEntitlements(String accountId) {
        // Prepare to make the callout
        String endpoint = 'https://api.companyx.com/consumer/v5/accounts/entitlements?accountId=' + accountId;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Add the OAuth token to the request header
        request.setEndpoint('callout:CompanyX_API' + endpoint);

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            // Parse the response to extract entitlement data
            Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Map<String, Object>> entitlements = (List<Map<String, Object>>) responseBody.get('entitlements');

            // Transform the raw data into Apex class list
            List<Entitlement> entitlementList = new List<Entitlement>();
            for (Map<String, Object> entitlement : entitlements) {
                Entitlement ent = new Entitlement();
                ent.accountId = (String) entitlement.get('accountId');
                ent.startDate = (String) entitlement.get('startDate');
                ent.endDate = (String) entitlement.get('endDate');
                ent.productId = (String) entitlement.get('productId');
                ent.productName = (String) entitlement.get('productName');
                entitlementList.add(ent);
            }
            return entitlementList;
        } else {
            throw new AuraHandledException('Failed to fetch entitlements: ' + response.getStatus());
        }
    }

    // Inner Apex class to hold entitlement data
    public class Entitlement {
        @AuraEnabled public String accountId;
        @AuraEnabled public String startDate;
        @AuraEnabled public String endDate;
        @AuraEnabled public String productId;
        @AuraEnabled public String productName;
    }
}