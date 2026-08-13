/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 06-07-2025
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class GoogleSheetsController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getPortfolioProjects() {
        try {
            // Replace with your Google Apps Script Web App URL
            String endpoint = 'https://script.google.com/macros/s/AKfycbxjtyVPSpsKPMtyxfSCz12sPabnMC8NlU9OjyPtG75NyaT2KMx6_f_q98syQLSsm8dyfA/exec'; // e.g., https://script.google.com/macros/s/AKfyc.../exec

            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            req.setHeader('Accept', 'application/json');
            req.setHeader('User-Agent', 'Salesforce/1.0 (compatible; PostmanRuntime/7.42.0)');
            req.setHeader('Content-Type', 'application/json');
            req.setTimeout(120000);

            Http http = new Http();
            HttpResponse res = http.send(req);

            // Handle redirects (up to 3)
            Integer redirectCount = 0;
            while (res.getStatusCode() == 302 && redirectCount < 3) {
                String redirectUrl = res.getHeader('Location');
                if (String.isBlank(redirectUrl)) {
                    throw new AuraHandledException('302 Redirect with no Location header');
                }
                System.debug('Redirecting to: ' + redirectUrl);
                req.setEndpoint(redirectUrl);
                res = http.send(req);
                redirectCount++;
            }

            if (res.getStatusCode() == 200) {
                // Log response for debugging
                System.debug('Response Body: ' + res.getBody());

                // Parse JSON flexibly
                Object responseBody = JSON.deserializeUntyped(res.getBody());
                List<Object> rows;

                if (responseBody instanceof List<Object>) {
                    // Direct array (Google Apps Script)
                    rows = (List<Object>) responseBody;
                } else if (responseBody instanceof Map<String, Object>) {
                    // Object with 'values' (e.g., Google Sheets API or wrapper)
                    Map<String, Object> responseMap = (Map<String, Object>) responseBody;
                    if (responseMap.containsKey('error')) {
                        throw new AuraHandledException('Google Sheets error: ' + responseMap.get('error'));
                    }
                    if (responseMap.containsKey('values')) {
                        rows = (List<Object>) responseMap.get('values');
                    } else {
                        throw new AuraHandledException('Unexpected JSON format: no values key');
                    }
                } else {
                    throw new AuraHandledException('Unexpected JSON format');
                }

                List<Map<String, String>> projects = new List<Map<String, String>>();
                // Skip header row
                for (Integer i = 1; i < rows.size(); i++) {
                    List<Object> row = (List<Object>) rows[i];
                    Map<String, String> project = new Map<String, String>();
                    project.put('Name', row.size() > 0 ? String.valueOf(row[0]) : '');
                    project.put('Description', row.size() > 1 ? String.valueOf(row[1]) : '');
                    project.put('Role', row.size() > 2 ? String.valueOf(row[2]) : '');
                    projects.add(project);
                }
                return projects;
            } else {
                throw new AuraHandledException('Failed to fetch data: ' + res.getStatus() + ' (' + res.getStatusCode() + ')');
            }
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }
}