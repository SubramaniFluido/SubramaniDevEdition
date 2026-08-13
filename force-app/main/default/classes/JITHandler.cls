global class JITHandler implements Auth.SamlJitHandler {
//JIT Handler Exception
private class JitException extends Exception{}
//Method to insert or update a user record
@testVisible
private void handleUser(boolean create, User user, Map<String, String> attributes,
String federationIdentifier, boolean isStandard) {
if(create && attributes.containsKey('User.Username')) {
user.Username = attributes.get('User.Username');
}
if(create) {
if(attributes.containsKey('User.FederationIdentifier')) {
user.FederationIdentifier = attributes.get('User.FederationIdentifier');
} else {
user.FederationIdentifier = federationIdentifier;
}
}
if(attributes.containsKey('User.Phone')) {
user.Phone = attributes.get('User.Phone');
}
if(attributes.containsKey('User.Email')) {
user.Email = attributes.get('User.Email');
}
if(attributes.containsKey('User.FirstName')) {
user.FirstName = attributes.get('User.FirstName');
  }
if(attributes.containsKey('User.LastName')) {
user.LastName = attributes.get('User.LastName');
}
if(attributes.containsKey('User.Title')) {
user.Title = attributes.get('User.Title');
}
if(attributes.containsKey('User.CompanyName')) {
user.CompanyName = attributes.get('User.CompanyName');
}
if(attributes.containsKey('User.AboutMe')) {
user.AboutMe = attributes.get('User.AboutMe');
}
if(attributes.containsKey('User.Street')) {
user.Street = attributes.get('User.Street');
}
if(attributes.containsKey('User.State')) {
user.State = attributes.get('User.State');
}
if(attributes.containsKey('User.City')) {
user.City = attributes.get('User.City');
}
if(attributes.containsKey('User.Zip')) {
  user.PostalCode = attributes.get('User.Zip');
}
if(attributes.containsKey('User.Country')) {
user.Country = attributes.get('User.Country');
}
if(attributes.containsKey('User.CallCenter')) {
user.CallCenterId = attributes.get('User.CallCenter');
}
if(attributes.containsKey('User.Manager')) {
user.ManagerId = attributes.get('User.Manager');
}
if(attributes.containsKey('User.MobilePhone')) {
user.MobilePhone = attributes.get('User.MobilePhone');
}
if(attributes.containsKey('User.DelegatedApproverId')) {
user.DelegatedApproverId = attributes.get('User.DelegatedApproverId');
}
if(attributes.containsKey('User.Department')) {
user.Department = attributes.get('User.Department');
}
if(attributes.containsKey('User.Division')) {
user.Division = attributes.get('User.Division');
}
if(attributes.containsKey('User.EmployeeNumber')) {
user.EmployeeNumber = attributes.get('User.EmployeeNumber');
}
if(attributes.containsKey('User.Extension')) {
user.Extension = attributes.get('User.Extension');
}
if(attributes.containsKey('User.Fax')) {
user.Fax = attributes.get('User.Fax');
}
if(attributes.containsKey('User.CommunityNickname')) {
user.CommunityNickname = attributes.get('User.CommunityNickname');
}
if(attributes.containsKey('User.ReceivesAdminInfoEmails')) {
String ReceivesAdminInfoEmailsVal = attributes.get('User.ReceivesAdminInfoEmails');
user.ReceivesAdminInfoEmails = '1'.equals(ReceivesAdminInfoEmailsVal) ||                            Boolean.valueOf(ReceivesAdminInfoEmailsVal);
}
if(attributes.containsKey('User.ReceivesInfoEmails')) {
String ReceivesInfoEmailsVal = attributes.get('User.ReceivesInfoEmails');
user.ReceivesInfoEmails = '1'.equals(ReceivesInfoEmailsVal) ||                                  Boolean.valueOf(ReceivesInfoEmailsVal);
}
List<Single_Sign_on__mdt>  singleSignProfileSettings = [SELECT id,Profile_Name__c,
LocaleSidKey__c,TimeZoneSidKey__c,EmailEncodingKey__c,
LanguageLocaleKey__c FROM Single_Sign_on__mdt
WHERE Profile_Name__c = 'Profile  Name'];
List<Profile> profileIds = [SELECT Id, Name FROM Profile
WHERE Name =: singleSignProfileSettings[0].Profile_Name__c];
if(attributes.containsKey('User.LocaleSidKey')) {
user.LocaleSidKey = attributes.get('User.LocaleSidKey');
} else if(create) {
user.LocaleSidKey = singleSignProfileSettings[0].LocaleSidKey__c;
}
if(attributes.containsKey('User.LanguageLocaleKey')) {
user.LanguageLocaleKey = attributes.get('User.LanguageLocaleKey');
} else if(create) {
user.LanguageLocaleKey = singleSignProfileSettings[0].LanguageLocaleKey__c;
}
if( attributes.containsKey('User.Alias') && attributes.get('User.Alias') !=''
&& attributes.get('User.Alias') != null ) {
user.Alias = attributes.get('User.Alias');
} else if(create) {
String alias ='';
if(user.FirstName == null) {
alias = user.LastName;
} else {
alias = user.FirstName.charAt(0) + user.LastName;
}
if(alias.length() > 5) {
alias = alias.substring(0, 5);
}
user.Alias = alias;
}
if(attributes.containsKey('User.TimeZoneSidKey')) {
user.TimeZoneSidKey = attributes.get('User.TimeZoneSidKey');
} else if(create) {
user.TimeZoneSidKey = singleSignProfileSettings[0].TimeZoneSidKey__c;
}
if(attributes.containsKey('User.EmailEncodingKey')) {
user.EmailEncodingKey = attributes.get('User.EmailEncodingKey');
} else if(create) {
user.EmailEncodingKey = singleSignProfileSettings[0].EmailEncodingKey__c;
}
/*
* If you are updating Contact or Account object fields, you cannot update the following User fields at the same time.
* If your identity provider sends these User fields as attributes along with Contact
* or Account fields, you must modify the logic in this class to update either these
* User fields or the Contact and Account fields. */
if(attributes.containsKey('User.IsActive')) {
  String IsActiveVal = attributes.get('User.IsActive');
user.IsActive = '1'.equals(IsActiveVal) || Boolean.valueOf(IsActiveVal);
}else if(create){
user.IsActive = true;
}else if (!create){
     List<User> userList = [SELECT isActive,username,Profile.Name,FederationIdentifier
FROM User
WHERE (FederationIdentifier = :federationIdentifier OR
           username =:federationIdentifier) AND isActive = false ];
if(userList.size() > 0){
user.ProfileId = profileIds[0].Id;
user.IsActive = true;
}
}
if(attributes.containsKey('User.ProfileId')) {
String userProfileId = attributes.get('User.ProfileId');
Profile profileId = [SELECT Id FROM Profile WHERE Id =: userProfileId];
user.ProfileId = profileId.Id;
} else if(create){
user.ProfileId = profileIds[0].Id;
}
if(attributes.containsKey('User.UserRoleId')) {
String userRole = attributes.get('User.UserRoleId');
UserRole role = [SELECT Id FROM UserRole WHERE Id=:userRole];
user.UserRoleId = role.Id;
}
if(create)
{
insert user;
}else {
update user;
}
}
//Method to insert or update a Contact record
@TestVisible
private void handleContact(boolean create, String accountId, User user,
Map<String, String> attributes) {
Contact contactIns;
boolean newContact = false;
if(create) {
if(attributes.containsKey('User.Contact')) {
String contact = attributes.get('User.Contact');
contactIns = [SELECT Id, AccountId FROM Contact WHERE Id=:contact];
user.ContactId = contact;
} else {
contactIns = new Contact();
newContact = true;
}
}
else{
List<Contact> contactList = [SELECT Id,User__c,Email,AccountId FROM Contact
WHERE User__c=:user.Id ];
if(contactList.size() > 0)
contactIns = contactList[0];
}
List<User> userInfo = [SELECT id,FirstName,LastName,Email FROM User WHERE Id =: user.Id];
if(attributes.containsKey('Contact.Email')) {
contactIns.Email = attributes.get('Contact.Email');
}else{
//if contact Email id not in map attribute
if(userInfo.size() > 0)
contactIns.Email = userInfo[0].Email;
}
if(attributes.containsKey('Contact.FirstName')) {
contactIns.FirstName = attributes.get('Contact.FirstName');
}else{
//if contact FirstName id not in map attribute
if(userInfo.size() > 0)
contactIns.FirstName = userInfo[0].FirstName;
}
if(attributes.containsKey('Contact.LastName')) {
contactIns.LastName = attributes.get('Contact.LastName');
}else{
//if contact LastName id not in map attribute
if(userInfo.size() > 0)
contactIns.LastName =userInfo[0].LastName;
}
if(attributes.containsKey('Contact.Phone')) {
contactIns.Phone = attributes.get('Contact.Phone');
}
if(attributes.containsKey('Contact.MailingStreet')) {
contactIns.MailingStreet = attributes.get('Contact.MailingStreet');
}
if(attributes.containsKey('Contact.MailingCity')) {
contactIns.MailingCity = attributes.get('Contact.MailingCity');
}
if(attributes.containsKey('Contact.MailingState')) {
contactIns.MailingState = attributes.get('Contact.MailingState');
}
if(attributes.containsKey('Contact.MailingCountry')) {
contactIns.MailingCountry = attributes.get('Contact.MailingCountry');
}
if(attributes.containsKey('Contact.MailingPostalCode')) {
contactIns.MailingPostalCode = attributes.get('Contact.MailingPostalCode');
}
if(attributes.containsKey('Contact.OtherStreet')) {
contactIns.OtherStreet = attributes.get('Contact.OtherStreet');
}
if(attributes.containsKey('Contact.OtherCity')) {
contactIns.OtherCity = attributes.get('Contact.OtherCity');
}
if(attributes.containsKey('Contact.OtherState')) {
contactIns.OtherState = attributes.get('Contact.OtherState');
}
if(attributes.containsKey('Contact.OtherCountry')) {
contactIns.OtherCountry = attributes.get('Contact.OtherCountry');
}
if(attributes.containsKey('Contact.OtherPostalCode')) {
contactIns.OtherPostalCode = attributes.get('Contact.OtherPostalCode');
}
if(attributes.containsKey('Contact.AssistantPhone')) {
contactIns.AssistantPhone = attributes.get('Contact.AssistantPhone');
}
if(attributes.containsKey('Contact.Department')) {
contactIns.Department = attributes.get('Contact.Department');
}
if(attributes.containsKey('Contact.Description')) {
contactIns.Description = attributes.get('Contact.Description');
}
if(attributes.containsKey('Contact.Fax')) {
contactIns.Fax = attributes.get('Contact.Fax');
}
if(attributes.containsKey('Contact.HomePhone')) {
contactIns.HomePhone = attributes.get('Contact.HomePhone');
}
if(attributes.containsKey('Contact.MobilePhone')) {
contactIns.MobilePhone = attributes.get('Contact.MobilePhone');
}
if(attributes.containsKey('Contact.OtherPhone')) {
contactIns.OtherPhone = attributes.get('Contact.OtherPhone');
}
  if(attributes.containsKey('Contact.Title')) {
contactIns.Title = attributes.get('Contact.Title');
}
if(attributes.containsKey('Contact.Salutation')) {
contactIns.Salutation = attributes.get('Contact.Salutation');
}
if(attributes.containsKey('Contact.LeadSource')) {
contactIns.LeadSource = attributes.get('Contact.LeadSource');
}
if(attributes.containsKey('Contact.DoNotCall')) {
      String DoNotCallVal = attributes.get('Contact.DoNotCall');
contactIns.DoNotCall = '1'.equals(DoNotCallVal) || Boolean.valueOf(DoNotCallVal);
}
if(attributes.containsKey('Contact.HasOptedOutOfEmail')) {
String HasOptedOutOfEmailVal = attributes.get('Contact.HasOptedOutOfEmail');
contactIns.HasOptedOutOfEmail = '1'.equals(HasOptedOutOfEmailVal) ||                                Boolean.valueOf(HasOptedOutOfEmailVal);
}
if(attributes.containsKey('Contact.HasOptedOutOfFax')) {
String HasOptedOutOfFaxVal = attributes.get('Contact.HasOptedOutOfFax');
contactIns.HasOptedOutOfFax = '1'.equals(HasOptedOutOfFaxVal) ||                                    Boolean.valueOf(HasOptedOutOfFaxVal);
}
if(attributes.containsKey('Contact.Owner')) {
contactIns.OwnerId = attributes.get('Contact.Owner');
}
if(attributes.containsKey('Contact.AssistantName')) {
contactIns.AssistantName = attributes.get('Contact.AssistantName');
}
if(attributes.containsKey('Contact.Birthdate')) {
contactIns.Birthdate = Date.valueOf(attributes.get('Contact.Birthdate'));
}
contactIns.AccountId = accountId;
contactIns.User__c = user.Id;
if(newContact) {
Database.DMLOptions dml = new Database.DMLOptions();
dml.DuplicateRuleHeader.allowSave = true;
dml.DuplicateRuleHeader.runAsCurrentUser = true;
Database.SaveResult sr = Database.insert(contactIns, dml);
} else {
update(contactIns);
}
}
//Method to insert or update a Account record
@testVisible
private String handleAccount(boolean create, User user, Map<String, String> attributes) {
Account accIns;
boolean newAccount = false;
if(create) {
if(attributes.containsKey('User.Account')) {
String account = attributes.get('User.Account');
accIns = [SELECT Id FROM Account WHERE Id=:account];
} else {
if(attributes.containsKey('User.Contact')) {
String contact = attributes.get('User.Contact');
Contact con = [SELECT Id, AccountId FROM Contact WHERE Id =: contact];
String account = con.AccountId;
accIns = [SELECT Id FROM Account WHERE Id=:account];
} else {
accIns  = new Account();
newAccount = true;
}
}
} else {
if(attributes.containsKey('User.Account')) {
String account = attributes.get('User.Account');
accIns = [SELECT Id FROM Account WHERE Id=:account];
}
else {
if(attributes.containsKey('User.Contact')) {
String contact = attributes.get('User.Contact');
Contact con = [SELECT Id, AccountId FROM Contact WHERE Id=:contact];
String account = con.AccountId;
accIns = [SELECT Id FROM Account WHERE Id=:account];
} else{
List<Contact> con = [SELECT Id,User__c,Email, AccountId FROM Contact
WHERE  User__c =: user.Id];
If(con.Size() > 0){
     String account = con[0].AccountId;
accIns = [SELECT Id,Name FROM Account WHERE Id=:account];
}
}
}
}
List<User> userInfo = [SELECT id,FirstName,LastName,Email FROM User WHERE Id =: user.Id];
if(attributes.containsKey('Account.Name')) {
accIns.Name = attributes.get('Account.Name');
}else{
if(userInfo.size() > 0)
{
if(userInfo[0].FirstName != null)
{
accIns.Name = userInfo[0].FirstName +' '+ userInfo[0].LastName;
}
}
    else
accIns.Name = user.Email;
}
if(attributes.containsKey('Account.AccountNumber')) {
accIns.AccountNumber = attributes.get('Account.AccountNumber');
}
if(attributes.containsKey('Account.Owner')) {
accIns.OwnerId = attributes.get('Account.Owner');
}
if(attributes.containsKey('Account.BillingStreet')) {
accIns.BillingStreet = attributes.get('Account.BillingStreet');
}
if(attributes.containsKey('Account.BillingCity')) {
accIns.BillingCity = attributes.get('Account.BillingCity');
}
if(attributes.containsKey('Account.BillingState')) {
accIns.BillingState = attributes.get('Account.BillingState');
}
if(attributes.containsKey('Account.BillingCountry')) {
accIns.BillingCountry = attributes.get('Account.BillingCountry');
}
if(attributes.containsKey('Account.BillingPostalCode')) {
accIns.BillingPostalCode = attributes.get('Account.BillingPostalCode');
}
if(attributes.containsKey('Account.AnnualRevenue')) {
accIns.AnnualRevenue = Integer.valueOf(attributes.get('Account.AnnualRevenue'));
}
if(attributes.containsKey('Account.Description')) {
accIns.Description = attributes.get('Account.Description');
}
if(attributes.containsKey('Account.Fax')) {
accIns.Fax = attributes.get('Account.Fax');
}
if(attributes.containsKey('Account.NumberOfEmployees')) {
accIns.NumberOfEmployees = Integer.valueOf(attributes.get('Account.NumberOfEmployees'));
}
if(attributes.containsKey('Account.Phone')) {
accIns.Phone = attributes.get('Account.Phone');
}
if(attributes.containsKey('Account.ShippingStreet')) {
accIns.ShippingStreet = attributes.get('Account.ShippingStreet');
}
if(attributes.containsKey('Account.ShippingCity')) {
accIns.ShippingCity = attributes.get('Account.ShippingCity');
}
if(attributes.containsKey('Account.ShippingState')) {
accIns.ShippingState = attributes.get('Account.ShippingState');
}
if(attributes.containsKey('Account.ShippingCountry')) {
accIns.ShippingCountry = attributes.get('Account.ShippingCountry');
}
if(attributes.containsKey('Account.ShippingPostalCode')) {
accIns.ShippingPostalCode = attributes.get('Account.ShippingPostalCode');
}
if(attributes.containsKey('Account.Sic')) {
accIns.Sic = attributes.get('Account.Sic');
}
if(attributes.containsKey('Account.TickerSymbol')) {
accIns.TickerSymbol = attributes.get('Account.TickerSymbol');
}
if(attributes.containsKey('Account.Website')) {
accIns.Website = attributes.get('Account.Website');
}
if(attributes.containsKey('Account.Industry')) {
accIns.Industry = attributes.get('Account.Industry');
}
if(attributes.containsKey('Account.Ownership')) {
accIns.Ownership = attributes.get('Account.Ownership');
}
if(attributes.containsKey('Account.Rating')) {
accIns.Rating = attributes.get('Account.Rating');
}
if(newAccount) {
Database.DMLOptions dml = new Database.DMLOptions();
dml.DuplicateRuleHeader.allowSave = true;
dml.DuplicateRuleHeader.runAsCurrentUser = true;
Database.SaveResult sr = Database.insert(accIns, dml);
} else {
update(accIns);
}
return accIns.Id;
}
//This method is called if the user has logged in before with SAML single sign-on and then logs in again
private void handleJit(boolean create, User user, Id samlSsoProviderId, Id communityId,
Id portalId, String federationIdentifier, Map<String, String> attributes, String assertion) {
if(communityId != null || portalId != null) {
handleUser(create, user, attributes, federationIdentifier, false);
     String account = handleAccount(create, user, attributes);
handleContact(create, account, user, attributes);
} else {
handleUser(create, user, attributes, federationIdentifier, true);
}
}
/*Returns a User object using the specified Federation ID.
* The User object corresponds to the user information and may be a new user that hasn't t been inserted in the database
* or may represent an existingser record in the database. */
global User createUser(Id samlSsoProviderId, Id communityId, Id portalId,
String federationIdentifier,Map<String, String> attributes, String assertion) {
User userIns = new User();
handleJit(true, userIns, samlSsoProviderId, communityId, portalId, federationIdentifier,
attributes, assertion);
return userIns;
}
/*Updates the specified user's information.
* This method is called if the user has logged in before with SAML single sign-on and then logs in again*/
global void updateUser(Id userId, Id samlSsoProviderId, Id communityId, Id portalId,
String federationIdentifier,
Map<String, String> attributes, String assertion) {
User user = [SELECT Id, FirstName, ContactId FROM User WHERE Id =:userId];
handleJit(false, user, samlSsoProviderId, communityId, portalId,federationIdentifier,
attributes, assertion);
}
}