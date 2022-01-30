public class AccountTriggerHelper {
    public static void updateMembershipStatus(Account a) {
                if (a.Membership_Status__c == 'Active') {
                    if(a.Card_Status__c == 'Pending') {
                                 a.Membership_Status__c = 'Inactive';
                             }
                    if(a.Card_Status__c == 'Cancelled') {
                                 a.Membership_Status__c = 'Cancelled';
                             }
                }
    }
    public static void handleExpiredCard(Account a) {
        if(a.Membership_Status__c == 'Active'){
            if(a.Expiration_Date__c < date.today()) {
                ExpiredCardScheduler sch = new ExpiredCardScheduler();
                List<String> cronExpression = cronGenerator.createCron(a);
                String jobName = a.Email__c;
                Id scheduleId = System.schedule(jobName, cronExpression[0], sch);
                    }
        }
    }
}