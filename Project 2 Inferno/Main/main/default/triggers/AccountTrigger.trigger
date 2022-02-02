trigger AccountTrigger on Account (before update) {
/*- (before update) If payment's not made, reduce account tier
  - (before update) Reward subscribers for a subscription streak
  - todo: make switch statement
*/
    if(Trigger.isBefore) {
        if(Trigger.isUpdate) {
            for (Account a : Trigger.new) {
                AccountTriggerHelper.updateMembershipStatus(a);
                AccountTriggerHelper.handleExpiredCard(a);
            }
        }
    }
}