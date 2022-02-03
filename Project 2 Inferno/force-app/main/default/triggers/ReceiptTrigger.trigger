trigger ReceiptTrigger on Receipt__c (before insert, after insert) {
    if((Trigger.isInsert) && (Trigger.isBefore)){
        ReceiptTriggerHelper.verifyDates(Trigger.new);
    }
    if((Trigger.isInsert) && (Trigger.isAfter)){
        ReceiptTriggerHelper.changeSubscriptionTiming(Trigger.new);
    }
}