global class ExpiredCardScheduler implements Schedulable {
    global void execute (SchedulableContext sc) {
        CronTrigger job = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger ORDER BY CreatedDate DESC LIMIT 1];
        CronJobDetail cjd = [SELECT Id, Name, JobType FROM CronJobDetail WHERE Id = :job.CronJobDetail.Id];
        List<Account> a = [SELECT Membership_Status__c, Card_Status__c FROM Account WHERE Email__c = :cjd.Name LIMIT 1];
        a[0].Membership_Status__c = 'Inactive';
        a[0].Card_Status__c = 'Pending';
        update a[0];
    }
}