@isTest
public class AccountDataFactory {
    public static List<Account> createAccounts(Integer n, String cardStatus, Date cardExpiration) {
        List<Account> newAccounts = new List<Account>();
        for(Integer i = 0; i < n ; i++){
         Account a = new Account(
            Name='Test Account ' + i, CVV__c='123', 
            Card_Number__c='1234123412341234', Card_Type__c='Visa', Email__c='test' + i + '@email.com', 
            Membership_Status__c='Active', Name_On_Card__c='Señor Test ' + i, 
            Password__c='bestPassword');
            a.Card_Status__c = cardStatus;
            a.Expiration_Date__c = cardExpiration;
            newAccounts.add(a);           
        }
    insert newAccounts;
    return newAccounts;
    }
}