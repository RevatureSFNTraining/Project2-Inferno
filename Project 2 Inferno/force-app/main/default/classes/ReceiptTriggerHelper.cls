public with sharing class ReceiptTriggerHelper {
    public ReceiptTriggerHelper() {

    }

    public static void verifyDates(List<Receipt__c> newReceipts){
        for(Receipt__c rec : newReceipts){
            Product2 product = rec.Product__c;
            String v1 = 'Month-to-Month';
            if(product.Duration__c == v1){
                if((rec.Start_Date__c.daysBetween(rec.End_Date__c) < 28) || (rec.Start_Date__c.daysBetween(rec.End_Date__c) > 31) ){
                    rec.addError('Start/End Date and Product don\'t match up');
                }
            }

            String v2 = 'Annual';
            if(product.Duration__c == v2){
                if((rec.Start_Date__c.daysBetween(rec.End_Date__c) < 364) || (rec.Start_Date__c.daysBetween(rec.End_Date__c) > 367) ){
                    rec.addError('Start/End Date and Product don\'t match up');
                }
            }
        }

    }
}
