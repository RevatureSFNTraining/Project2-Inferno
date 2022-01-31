@isTest
private class ReceiptTriggerTests {
    @TestSetup
    static void makeData(){
        Account testAcc1 = new Account();
        Account testAcc2 = new Account();
        testAcc1.Name = 'Bill';
        testAcc1.Email__c = 'bill@example.org';
        testAcc1.Membership_Status__c = 'Active';
        testAcc1.Password__c = 'pass12345';
        testAcc1.Name_On_Card__c = 'Bill Dollar';
        testAcc1.Card_Number__c = '1111222233334444';
        testAcc1.Card_Type__c = 'Visa';
        testAcc1.CVV__c = '123';
        testAcc1.Expiration_Date__c = date.today().addDays(-1);
        testAcc1.Card_Status__c = 'Active';
        //testAcc1.BillingAddress = '123 Main Street, New York NY, 12345';
		
        
        testAcc2.Name = 'Boll';
        testAcc2.Email__c = 'boll@example.org';
        testAcc2.Membership_Status__c = 'Active';
        testAcc2.Password__c = 'pass12345';
        testAcc2.Name_On_Card__c = 'Boll Dillar';
        testAcc2.Card_Number__c = '2222333344445555';
        testAcc2.Card_Type__c = 'Visa';
        testAcc2.CVV__c = '234';
        testAcc2.Expiration_Date__c = date.today().addDays(-1);
        testAcc2.Card_Status__c = 'Active';
        //testAcc2.BillingAddress = '234 Main Street, New York NY, 12345';

        Product2 paymonth = new Product2();
        Product2 payyear = new Product2();
        
        paymonth.Service_Tiers__c = 'Pay';
        paymonth.Duration__c = 'Month to Month';
        paymonth.Name = 'paymonth';

        payyear.Service_Tiers__c = 'Pay';
        payyear.Duration__c = '1 year';
        payyear.Name = 'payyear';
        
        System.debug(testAcc1.Name);
        insert testAcc1;
        insert testAcc2;
        insert paymonth;
        insert payyear;
    }

    @isTest 
    static void testVerifyDatesPositive() {
        Test.startTest();
        List<Account> myaccs = [SELECT Id FROM Account];
        List<Product2> myprods = [SELECT Id, Duration__c FROM Product2];
        List<Receipt__c> myrecs = new List<Receipt__c>();
        for (Integer i = 0; i < 2; i++){
            Receipt__c rec = new Receipt__c();
            rec.Account__c = myaccs[i].Id;
            System.debug('Receipt account: '+rec.Account__r.Id);
            rec.Product__c = myprods[i].Id;
            rec.Start_Date__c = date.today();
            if(myprods[i].Duration__c == 'Month to Month'){
                System.debug('Month');
                rec.End_Date__c = date.today().addMonths(1);
            } else {
                System.debug('year');
                rec.End_Date__c = date.today().addYears(1);
            }
            
            myrecs.add(rec);
        }

        Database.SaveResult[] srlist = Database.insert(myrecs, false);
        
        
        for (Receipt__c rec : myrecs){
            System.debug(rec.Product__r.Duration__c);
            System.debug(rec.Start_Date__c.daysBetween(rec.End_Date__c));
        }

        for (Database.SaveResult sr : srlist){
            System.debug(sr.getErrors());
            System.assert(sr.isSuccess());
        }
        Test.stopTest();
        
    }

    @isTest
    static void testVerifyDatesNegative() {
        Test.startTest();
        List<Account> myaccs = [SELECT Id FROM Account];
        System.debug('How many accounts: '+myaccs.size());
        List<Product2> myprods = [SELECT Id, Duration__c FROM Product2];
        List<Receipt__c> myrecs = new List<Receipt__c>();
        for (Integer i = 0; i < 2; i++){
            Receipt__c rec = new Receipt__c();
            rec.Account__c = myaccs[i].Id;
            System.debug('Receipt account: '+rec.Account__r.Id);
            rec.Product__c = myprods[i].Id;
            rec.Start_Date__c = date.today();
            if(myprods[i].Duration__c == 'Month to Month'){
                System.debug('Month');
                rec.End_Date__c = date.today().addYears(1);
            } else {
                System.debug('year');
                rec.End_Date__c = date.today().addMonths(1);
            }
            
            myrecs.add(rec);
        }

        Database.SaveResult[] srlist = Database.insert(myrecs, false);
        
        
        for (Receipt__c rec : myrecs){
            System.debug(rec.Product__r.Duration__c);
            System.debug(rec.Start_Date__c.daysBetween(rec.End_Date__c));
        }

        for (Database.SaveResult sr : srlist){
            System.debug(sr.getErrors());
            System.assert(!sr.isSuccess());
        }
        Test.stopTest();
        
    }
}