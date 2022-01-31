public with sharing class ReceiptTriggerHelper {


    public static void verifyDates(List<Receipt__c> newReceipts){
        List<Id> prodIds = new List<Id>();
        for(Receipt__c rec : newReceipts){
            prodIds.add(rec.Product__c);
        }
        List<Product2> relatedprods = [SELECT Id, Duration__c FROM Product2 WHERE Id IN :prodIds];
        
        
        for(Receipt__c rec : newReceipts){
            Product2 prod;
            for(Product2 rprod : relatedprods){
                if(rec.Product__c == rprod.Id){
                    prod=rprod;
                }
            }
            String v1 = 'Month to Month';
            if(prod.Duration__c == v1){
                System.debug('Timing'+rec.Start_Date__c.daysBetween(rec.End_Date__c));
                if((rec.Start_Date__c.daysBetween(rec.End_Date__c) < 28) || (rec.Start_Date__c.daysBetween(rec.End_Date__c) > 31) ){
                    rec.addError('Start/End Date and Product don\'t match up');
                }
            }

            String v2 = '1 year';
            if(prod.Duration__c == v2){
                if((rec.Start_Date__c.daysBetween(rec.End_Date__c) < 364) || (rec.Start_Date__c.daysBetween(rec.End_Date__c) > 367) ){
                    rec.addError('Start/End Date and Product don\'t match up');
                }
            }
        }
    }

    public static void changeSubscriptionTiming(List<Receipt__c> recs){
        List<Id> accIds = new List<Id>();
        for(Receipt__c rec : recs){
            accIds.add(rec.Account__c);
        }
        List<Account> relatedaccs = [SELECT Id, Start_Date__c, Expiration_Date__c FROM Account WHERE Id IN :accIds];
        
        List<Account> accs = new List<Account>();
        for (Receipt__c rec : recs) {
            Account acc;
            for(Account racc : relatedaccs){
                if(rec.Account__c == racc.Id){
                    acc=racc;
                }
            }
            //only change start date if account isn't activated or is expired
            System.debug('Account start date: '+acc.Start_Date__c);
            System.debug('Account Id: '+rec.Account__c);
            if((acc.Start_Date__c == null) || (acc.Expiration_Date__c < date.today())){
                
                acc.Start_Date__c = rec.Start_Date__c;
            }
            //extend expiration date if subscription is ongoing; otherwise, generate one based on the new start date.
            if(acc.Expiration_Date__c > date.today()){
                acc.Expiration_Date__c = acc.Expiration_Date__c.addDays(rec.Start_Date__c.daysBetween(rec.End_Date__c));
            } else {
                acc.Expiration_Date__c = acc.Start_Date__c.addDays(rec.Start_Date__c.daysBetween(rec.End_Date__c));
            }
            accs.add(acc);
        }
        update accs;
    }




}