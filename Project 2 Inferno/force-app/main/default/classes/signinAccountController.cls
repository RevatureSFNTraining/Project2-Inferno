public with sharing class signinAccountController {
    public signinAccountController() {

    }

    @AuraEnabled(cacheable=true)
    public static String getAccount(String email){
        List<Account> acc = [SELECT Id, Name, Email__c, Membership_Status__c, 
            Password__c, Name_On_Card__c, Card_Number__c, Card_Type__c,
            CVV__c, Expiration_Date__c, Card_Status__c, BillingAddress
             FROM Account WHERE Email__c = :email];
        System.debug(acc[0].Name);
        System.debug(acc[0].Id);
        return (String)acc[0].Id;
        
    }
}
