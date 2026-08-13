/** Class Name: CTPersonController
 *  Description: Main class for Person Object
 * Test Class: TBC
 * Author: Subramani
 * Date: 28-02-2021
 */
public with sharing class CTPersonController {

    //Blank contructor
    public CTPersonController() {

    }
    /* Method is used to generate unqiue token using mobile number
    *  Use MD5 hash algorith to generate one-way key
    * @Parmater : String of token
    * @Return : Unique String token
    */
    public static String getToken(String getToken){
        Blob targetBlob = Blob.valueOf(getToken);
        Blob hash = Crypto.generateDigest('MD5', targetBlob);
        String uniqueNum= EncodingUtil.base64Encode(hash);
        return uniqueNum;
    }

    public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
    }

    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm= searchTerm +'%';
        return [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c  WHERE (Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm  OR Token__c LIKE :searchTerm ) ORDER BY Status_Update_Date__c DESC];
    }

    public static Person__c getPersonById(String personId){
        List<Person__c> personList= [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c  WHERE (Id =: personId) ];
        if(!personList.isEmpty()){
            return personList[0];
        }
        return null;
    }

    public static Map<String,Integer> getHealthStatusCount(){
        Map<String, Integer> statusCountMap= new Map<String, Integer>();
        for(AggregateResult result: [SELECT Health_Status__c, count(id) personCount FROM Person__c group by Health_Status__c]){
            statusCountMap.put(String.ValueOf(result.get('Health_Status__c')), Integer.ValueOf(result.get('personCount')));
        }
        return statusCountMap;
    }

}