public class signinAccountController {
    public signinAccountController() {

    }

    @AuraEnabled(cacheable=true)
    public static String getAccount(string email, string password){
        List<Account> acc = [SELECT Id, Name, Email__c, Membership_Status__c, 
            Password__c, Name_On_Card__c, Card_Number__c, Card_Type__c,
            CVV__c, Expiration_Date__c, Card_Status__c, BillingAddress
             FROM Account WHERE Email__c = :email];
        if(password == acc[0].Password__c){
            return (String)acc[0].Id;
        }
        else {return null;}
    }

    @AuraEnabled(cacheable=false)
    public static List<String> searchResults(string text){
        List<Streaming_Content__c> searchresults = new List<Streaming_Content__c>();
        text = String.escapeSingleQuotes(text);
        String querytext = '%'+text+'%';

        searchresults = [SELECT Id FROM Streaming_Content__c WHERE Title__c LIKE :querytext];
        List<String> resultidlist = new List<String>();
        for(Streaming_Content__c result : searchresults){
            resultidlist.add((String)result.Id);
        }
        return resultidlist;
        
    }
}
