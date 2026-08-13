/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 06-09-2025
 * @last modified by  : Subramani Kumarasamy
**/
public class ContactController {
    @AuraEnabled
    public static void sendContactEmail(Map<String, String> contactData) {
        System.debug('Inside apex '+contactData);
        // Create Lead record from submitted details
        Lead newLead = new Lead();
        newLead.LastName = contactData.get('name') != null ? contactData.get('name') : 'Unknown';
        newLead.Company = contactData.get('company') != null && contactData.get('company') != '' 
                         ? contactData.get('company') : 'Not Provided';
        newLead.Email = contactData.get('email');
        newLead.MobilePhone = contactData.get('mobile');
        newLead.Country = contactData.get('country');
        newLead.Description = 'Requirement: ' + contactData.get('requirement') + '\n' +
                              'Urgency: ' + contactData.get('urgency') + '\n' +
                              'Budget: ' + contactData.get('budget');
        
        try {
            insert newLead;
        } catch (Exception e) {
            // Optionally handle insert errors, but still proceed to send email
            System.debug('Error inserting Lead: ' + e.getMessage());
        }
    }
}