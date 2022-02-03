@isTest
private class AcccountTriggerHelperTest {
	@isTest
    public static void singlePositiveTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 1;
        String cardStatus = 'Active';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
		AccountTriggerHelper.updateMembershipStatus(accs[0]);
        system.assertEquals('Active', accs[0].Card_Status__c);
        system.assertEquals('Active', accs[0].Membership_Status__c);      
    }
	@isTest
    public static void bulkPositiveTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 200;
        String cardStatus = 'Active';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
        for(Integer i = 0; i < accsToCreate; i++) {
			AccountTriggerHelper.updateMembershipStatus(accs[i]);
        	system.assertEquals('Active', accs[i].Card_Status__c);
        	system.assertEquals('Active', accs[i].Membership_Status__c);
        } 
    }
	@isTest
    public static void singleStatusPendingTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 1;
        String cardStatus = 'Pending';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
		AccountTriggerHelper.updateMembershipStatus(accs[0]);
        system.assertEquals('Pending', accs[0].Card_Status__c);
        system.assertEquals('Inactive', accs[0].Membership_Status__c);      
    }
	@isTest
    public static void bulkStatusPendingTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 200;
        String cardStatus = 'Pending';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
        for(Integer i = 0; i < accsToCreate; i++) {
			AccountTriggerHelper.updateMembershipStatus(accs[i]);
        	system.assertEquals('Pending', accs[i].Card_Status__c);
        	system.assertEquals('Inactive', accs[i].Membership_Status__c);
        } 
    }
	@isTest
    public static void singleStatusCancelledTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 1;
        String cardStatus = 'Cancelled';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
		AccountTriggerHelper.updateMembershipStatus(accs[0]);
        system.assertEquals('Cancelled', accs[0].Card_Status__c);
        system.assertEquals('Cancelled', accs[0].Membership_Status__c);      
    }
	@isTest
    public static void bulkStatusCancelledTest() {
        Date tomorrow = date.today().addDays(1);
        Integer accsToCreate = 200;
        String cardStatus = 'Cancelled';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, tomorrow);
        for(Integer i = 0; i < accsToCreate; i++) {
			AccountTriggerHelper.updateMembershipStatus(accs[i]);
        	system.assertEquals('Cancelled', accs[i].Card_Status__c);
        	system.assertEquals('Cancelled', accs[i].Membership_Status__c);
        } 
    }
    @isTest
    public static void verifySingleCardExpired() {
        Date yesterday = date.today().addDays(-1);
        Integer accsToCreate = 1;
        String cardStatus = 'Active';
        Account[] accs = AccountDataFactory.createAccounts(accsToCreate, cardStatus, yesterday);
        Test.startTest();
        AccountTriggerHelper.handleExpiredCard(accs[0]);
        Test.stopTest();
        CronTrigger job = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger ORDER BY CreatedDate DESC LIMIT 1];
        CronJobDetail cjd = [SELECT Id, Name, JobType FROM CronJobDetail WHERE Id = :job.CronJobDetail.Id];
        List<Account> a = [SELECT Email__c, Membership_Status__c, Card_Status__c FROM Account WHERE Email__c = :cjd.Name LIMIT 1];
        system.assertEquals(a[0].Email__c, accs[0].Email__c);
 		system.assertNotEquals(a[0].Card_Status__c, accs[0].Card_Status__c);
        system.assertNotEquals(a[0].Membership_Status__c, accs[0].Membership_Status__c);
        system.assertEquals('Pending', a[0].Card_Status__c);
        system.assertEquals('Inactive', a[0].Membership_Status__c);
    }
	
}