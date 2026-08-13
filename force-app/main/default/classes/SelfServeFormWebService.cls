@RestResource(urlMapping='/SelfServeForm/*')
global class SelfServeFormWebService {

    // Custom Exception Class for REST errors
    global class RestException extends Exception {
        global RestException(Integer statusCode, String message) {
            this.statusCode = statusCode;
            this.responseBody = Blob.valueof(message);
        }
        global Integer statusCode;
        global Blob responseBody;
    }

    // This method handles POST requests
    @HttpPost
    global static String processSelfServeDeal(String firstName, String lastName, String email, String country, String companyName) {

        // Parse inputs
        firstName = firstName != null ? firstName.trim() : '';
        lastName = lastName != null ? lastName.trim() : '';
        email = email != null ? email.trim() : '';
        country = country != null ? country.trim() : '';
        companyName = companyName != null ? companyName.trim() : '';

        // Validate required fields
        if (String.isEmpty(firstName) || String.isEmpty(lastName) || String.isEmpty(email) || 
            String.isEmpty(companyName) || String.isEmpty(country)) {
            throw new RestException(400, 'All required fields must be filled out.');
        }

        Account existingAccount;
        try {
            existingAccount = [
                SELECT Id, Name, OwnerId 
                FROM Account 
                WHERE Name = :companyName 
                LIMIT 1
            ];
        } catch (QueryException e) {
            existingAccount = null; // No account found
        }

        if (existingAccount == null) {
            // Create a new Account
            existingAccount = new Account(Name = companyName, BillingCountry = country);
            insert existingAccount;
        }

        Contact existingContact;
        try {
            existingContact = [
                SELECT Id, Email 
                FROM Contact 
                WHERE Email = :email AND AccountId = :existingAccount.Id 
                LIMIT 1
            ];
        } catch (QueryException e) {
            existingContact = null; // No contact found
        }

        if (existingContact == null) {
            // Create a new Contact
            existingContact = new Contact(
                FirstName = firstName,
                LastName = lastName,
                Email = email,
                MailingCountry = country,
                AccountId = existingAccount.Id
            );
            insert existingContact;
        }

        Opportunity existingSalesOpportunity;
        try {
            existingSalesOpportunity = [
                SELECT Id, Name, OwnerId, StageName 
                FROM Opportunity 
                WHERE AccountId = :existingAccount.Id 
                AND StageName NOT IN ('Closed Won', 'Closed Lost') 
                LIMIT 1
            ];
        } catch (QueryException e) {
            existingSalesOpportunity = null; // No active opportunity found
        }

        Opportunity selfServeOpportunity = new Opportunity(
            Name = 'Self-Serve Deal for ' + companyName,
            AccountId = existingAccount.Id,
            Amount = 30, // €30/month
            CloseDate = System.today(),
            StageName = 'Closed Won',
            OwnerId = existingSalesOpportunity != null ? existingSalesOpportunity.OwnerId : UserInfo.getUserId()
        );
        insert selfServeOpportunity;

        if (existingSalesOpportunity != null) {
            // Update Sales-Owned Opportunity
            existingSalesOpportunity.Self_Service_Deal__c = selfServeOpportunity.Id;
            update existingSalesOpportunity; // Apply changes to the database
        }

        // Notify the Sales Rep if applicable
        if (existingSalesOpportunity != null) {
            User salesOwner = [SELECT Email FROM User WHERE Id = :existingSalesOpportunity.OwnerId LIMIT 1];
            if (salesOwner != null && !String.isEmpty(salesOwner.Email)) {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                emailMsg.setToAddresses(new String[] { salesOwner.Email });
                emailMsg.setSubject('Self-Serve Deal Created');
                emailMsg.setPlainTextBody('A self-serve deal has been created for ' + companyName + 
                                          '. It is linked to your active Opportunity.');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailMsg });
            }
        }

        // Return success response
        return 'Success: Self-serve deal processed for ' + companyName;
    }
}