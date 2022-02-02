@isTest
public class CaseTrigger_Helper_Test {
    public CaseTrigger_Helper_Test() {

    }

    @TestSetup
    public static void makeData(){
    }

    //Check Account Tier Tests
    //------------------------------------------------
    //Attempt to create a case with a variety of Account and Movie tiers

    //Free Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Free
    //Movie Subscription Tier: Free
    @isTest
    public static void AccFreeMovFree(){
        Product2 freeSub = new Product2(Name = 'Free Subscription');
        freeSub.Family = 'Free';
        Streaming_Content__c freeVideo = new Streaming_Content__c(Tier__c = 'Free');
        Database.insert(freeSub);
        Database.insert(freeVideo);
        Case c = new Case(Streaming_Content__r = freeVideo,
                             Streaming_Content__c = freeVideo.Id,
                             ProductId = freeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
    }
    //Account Tier: Free
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccFreeMovPay(){
        Product2 freeSub = new Product2(Name = 'Free Subscription');
        freeSub.Family = 'Free';
        Streaming_Content__c payVideo = new Streaming_Content__c(Tier__c = 'Pay');
        Database.insert(freeSub);
        Database.insert(payVideo);
        Case c = new Case(Streaming_Content__r = payVideo,
                             Streaming_Content__c = payVideo.Id,
                             ProductId = freeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Free
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccFreeMovPrem(){
        Product2 freeSub = new Product2(Name = 'Free Subscription');
        freeSub.Family = 'Free';
        Streaming_Content__c premVideo = new Streaming_Content__c(Tier__c = 'Premium');
        Database.insert(freeSub);
        Database.insert(premVideo);
        Case c = new Case(Streaming_Content__r = premVideo,
                             Streaming_Content__c = premVideo.Id,
                             ProductId = freeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Free
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccFreeMovInval(){
        Product2 freeSub = new Product2(Name = 'Free Subscription');
        freeSub.Family = 'Free';
        Streaming_Content__c brokeVideo = new Streaming_Content__c(Tier__c = 'HoHoHo');
        Database.insert(freeSub);
        Database.insert(brokeVideo);
        Case c = new Case(Streaming_Content__r = brokeVideo,
                             Streaming_Content__c = brokeVideo.Id,
                             ProductId = freeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }



    //Pay Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Pay
    //Movie Subscription Tier: Free
    @isTest
    public static void AccPayMovFree(){
        Product2 paySub  = new Product2(Name = 'Paid Subscription');
        paySub.Family = 'Pay';
        Streaming_Content__c freeVideo = new Streaming_Content__c(Tier__c = 'Free');
        Database.insert(paySub);
        Database.insert(freeVideo);
        Case c = new Case(Streaming_Content__r = freeVideo,
                             Streaming_Content__c = freeVideo.Id,
                             ProductId = paySub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccPayMovPay(){
        Product2 paySub  = new Product2(Name = 'Paid Subscription');
        paySub.Family = 'Pay';
        Streaming_Content__c payVideo = new Streaming_Content__c(Tier__c = 'Pay');
        Database.insert(paySub);
        Database.insert(payVideo);
        Case c = new Case(Streaming_Content__r = payVideo,
                             Streaming_Content__c = payVideo.Id,
                             ProductId = paySub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccPayMovPrem(){
        Product2 paySub  = new Product2(Name = 'Paid Subscription');
        paySub.Family = 'Pay';
        Streaming_Content__c premVideo = new Streaming_Content__c(Tier__c = 'Premium');
        Database.insert(paySub);
        Database.insert(premVideo);
        Case c = new Case(Streaming_Content__r = premVideo,
                             Streaming_Content__c = premVideo.Id,
                             ProductId = paySub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccPayMovInval(){
        Product2 paySub  = new Product2(Name = 'Paid Subscription');
        paySub.Family = 'Pay';
        Streaming_Content__c brokeVideo = new Streaming_Content__c(Tier__c = 'HoHoHo');
        Database.insert(paySub);
        Database.insert(brokeVideo);
        Case c = new Case(Streaming_Content__r = brokeVideo,
                             Streaming_Content__c = brokeVideo.Id,
                             ProductId = paySub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }



    //Premium Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Premium
    //Movie Subscription Tier: Free
    @isTest
    public static void AccPremMovFree(){
        Product2 premSub  = new Product2(Name = 'Jolliest (Premium) Subscription');
        premSub.Family = 'Premium';
        Streaming_Content__c freeVideo = new Streaming_Content__c(Tier__c = 'Free');
        Database.insert(premSub);
        Database.insert(freeVideo);
        Case c = new Case(Streaming_Content__r = freeVideo,
                             Streaming_Content__c = freeVideo.Id,
                             ProductId = premSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccPremMovPay(){
        Product2 premSub  = new Product2(Name = 'Jolliest (Premium) Subscription');
        premSub.Family = 'Premium';
        Streaming_Content__c payVideo = new Streaming_Content__c(Tier__c = 'Pay');
        Database.insert(premSub);
        Database.insert(payVideo);
        Case c = new Case(Streaming_Content__r = payVideo,
                             Streaming_Content__c = payVideo.Id,
                             ProductId = premSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccPremMovPrem(){
        Product2 premSub  = new Product2(Name = 'Jolliest (Premium) Subscription');
        premSub.Family = 'Premium';
        Streaming_Content__c premVideo = new Streaming_Content__c(Tier__c = 'Premium');
        Database.insert(premSub);
        Database.insert(premVideo);
        Case c = new Case(Streaming_Content__r = premVideo,
                             Streaming_Content__c = premVideo.Id,
                             ProductId = premSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccPremMovInval(){
        Product2 premSub  = new Product2(Name = 'Jolliest (Premium) Subscription');
        premSub.Family = 'Premium';
        Streaming_Content__c brokeVideo = new Streaming_Content__c(Tier__c = 'HoHoHo');
        Database.insert(premSub);
        Database.insert(brokeVideo);
        Case c = new Case(Streaming_Content__r = brokeVideo,
                             Streaming_Content__c = brokeVideo.Id,
                             ProductId = premSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }



    //Invalid Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Invalid
    //Movie Subscription Tier: Free
    @isTest
    public static void AccInvalMovFree(){
        Product2 brokeSub = new Product2(Name = 'Illegal Subscription');
        brokeSub.Family = 'Orphan';
        Streaming_Content__c freeVideo = new Streaming_Content__c(Tier__c = 'Free');
        Database.insert(brokeSub);
        Database.insert(freeVideo);
        Case c = new Case(Streaming_Content__r = freeVideo,
                             Streaming_Content__c = freeVideo.Id,
                             ProductId = brokeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccInvalMovPay(){
        Product2 brokeSub = new Product2(Name = 'Illegal Subscription');
        brokeSub.Family = 'Orphan';
        Streaming_Content__c payVideo = new Streaming_Content__c(Tier__c = 'Pay');
        Database.insert(brokeSub);
        Database.insert(payVideo);
        Case c = new Case(Streaming_Content__r = payVideo,
                             Streaming_Content__c = payVideo.Id,
                             ProductId = brokeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccInvalMovPrem(){
        Product2 brokeSub = new Product2(Name = 'Illegal Subscription');
        brokeSub.Family = 'Orphan';
        Streaming_Content__c premVideo = new Streaming_Content__c(Tier__c = 'Premium');
        Database.insert(brokeSub);
        Database.insert(premVideo);
        Case c = new Case(Streaming_Content__r = premVideo,
                             Streaming_Content__c = premVideo.Id,
                             ProductId = brokeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccInvalMovInval(){
        Product2 brokeSub = new Product2(Name = 'Illegal Subscription');
        brokeSub.Family = 'Orphan';
        Streaming_Content__c brokeVideo = new Streaming_Content__c(Tier__c = 'HoHoHo');
        Database.insert(brokeSub);
        Database.insert(brokeVideo);
        Case c = new Case(Streaming_Content__r = brokeVideo,
                             Streaming_Content__c = brokeVideo.Id,
                             ProductId = brokeSub.Id,
                             Type = 'Electronic',
                             Subject = 'I was made for during Test Execution',
                             Case_Subject__c = 'Technical',
                             Status = 'New',
                             Origin = 'Web' );
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }


    //Check Video Reports Tests
    //---------------------------------------------------------------

    //Submit list of cases with just enough complaints; 10 (Positive)
    @isTest
    public static void EnoughComplaints(){
        List<Case> allCases = new List<Case>();
        Streaming_Content__c badVideo = new Streaming_Content__c(Title__c='Steps on the Roof');
        for(Integer i = 0; i < 10; i++){
            Case c = new Case(Case_Subject__c='Video Quality', 
                                Streaming_Content__r = badVideo,
                                Streaming_Content__c = badVideo.Id);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(badVideo.Needs_Review__c);
    }
    //Submit list of cases with not enough complaints; 8 (Negative)
    @isTest
    public static void NotEnoughComplaints(){
        List<Case> allCases = new List<Case>();
        Streaming_Content__c badVideo = new Streaming_Content__c(Title__c='Under the Mistletoe');
        for(Integer i = 0; i < 8; i++){
            Case c = new Case(Case_Subject__c='Video Quality', 
                                Streaming_Content__r = badVideo,
                                Streaming_Content__c = badVideo.Id);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(!badVideo.Needs_Review__c);
    }
    //Submit list of cases with too many complaints; 20 (Positive)
    @isTest
    public static void TooManyComplaints(){
        List<Case> allCases = new List<Case>();
        Streaming_Content__c badVideo = new Streaming_Content__c(Title__c='Avalanche');
        for(Integer i = 0; i < 20; i++){
            Case c = new Case(Case_Subject__c='Video Quality', 
                                Streaming_Content__r = badVideo,
                                Streaming_Content__c = badVideo.Id);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(badVideo.Needs_Review__c);
    }
    //Submit list of cases with no complaints; 0 (Negative)
    @isTest
    public static void NoComplaints(){
        List<Case> allCases = new List<Case>();
        Streaming_Content__c badVideo = new Streaming_Content__c(Title__c='The Perfect Gift');
        for(Integer i = 0; i < 10; i++){
            Case c = new Case(Case_Subject__c='Video Quality', 
                                Streaming_Content__r = badVideo,
                                Streaming_Content__c = badVideo.Id);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(!badVideo.Needs_Review__c);
    }
}
