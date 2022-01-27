trigger ReceiptTrigger on Receipt (before insert, after insert) {
    if((Trigger.isInsert) && (Trigger.isBefore)){
        ReceiptTriggerHelper.verifyDates(Trigger.new);
    }
}