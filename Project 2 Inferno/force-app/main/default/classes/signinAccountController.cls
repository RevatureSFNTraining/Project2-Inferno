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
    public static String makeAccount(string name, string email, string password, string nameoncard, 
                                    string cardnumber, string cvv, string billingaddress){
        Account acc = new Account();
        acc.Name = name;
        acc.Email__c = email;
        acc.Password__c = password;
        acc.Name_On_Card__c = nameoncard;
        acc.Card_Number__c = cardnumber;
        acc.CVV__c = cvv;
        //acc.BillingAddress = billingaddress;
        
        acc.Membership_Status__c = 'Active';
        acc.Card_Type__c = 'Visa';
        acc.Expiration_Date__c = date.today().addDays(1);
        acc.Card_Status__C = 'Active';

        Database.SaveResult sr = Database.insert(acc);
        String newid = null;
        if(sr.isSuccess()){
            Account newacc = [SELECT id FROM Account WHERE email__c = :email LIMIT 1];
            newid = newacc.id;
        } else {System.debug(sr.getErrors());}
        return newid;
    }
}
