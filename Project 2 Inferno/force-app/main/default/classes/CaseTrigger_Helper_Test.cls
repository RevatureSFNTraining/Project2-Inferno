@isTest
public class CaseTrigger_Helper_Test {
    public CaseTrigger_Helper_Test() {

    }
    @TestSetup
    static void makeData(){

        List<Case> allCases;

        Streaming_Content__c badVideo;
        Streaming_Content__c freeVideo = new Streaming_Content__c(Tier__c='Free');
        Streaming_Content__c payVideo = new Streaming_Content__c(Tier__c='Pay');
        Streaming_Content__c premVideo = new Streaming_Content__c(Tier__c='Premium');
        //For Negative Testing
        Streaming_Content__c brokeVideo = new Streaming_Content__c(Tier__c='Broke');

        Product2 freeSub = new Product2(Family='Free');
        Product2 paySub  = new Product2(Family='Pay');
        Product2 premSub  = new Product2(Family='Premium');
        //For Negative Testing
        Product2 brokeSub = new Product2(Family='Orphan');
    }



    //Check Account Tier Tests
    //------------------------------------------------

    //Free Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Free
    //Movie Subscription Tier: Free
    @isTest
    public static void AccFreeMovFree(){
        Case c = new Case(Streaming_Content__c = freeVideo, ProductId = freeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Free
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccFreeMovPay(){
        Case c = new Case(Streaming_Content__c = payVideo, ProductId = freeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Free
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccFreeMovPrem(){
        Case c = new Case(Streaming_Content__c = premVideo, ProductId = freeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Free
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccFreeMovInval(){
        Case c = new Case(Streaming_Content__c = brokeVideo, ProductId = freeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }



    //Pay Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Pay
    //Movie Subscription Tier: Free
    @isTest
    public static void AccPayMovFree(){
        Case c = new Case(Streaming_Content__c = freeVideo, ProductId = paySub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccPayMovPay(){
        Case c = new Case(Streaming_Content__c = payVideo, ProductId = paySub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccPayMovPrem(){
        Case c = new Case(Streaming_Content__c = premVideo, ProductId = paySub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Pay
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccPayMovInval(){
        Case c = new Case(Streaming_Content__c = brokeVideo, ProductId = paySub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }



    //Premium Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Premium
    //Movie Subscription Tier: Free
    @isTest
    public static void AccPremMovFree(){
        Case c = new Case(Streaming_Content__c = freeVideo, ProductId = premSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccPremMovPay(){
        Case c = new Case(Streaming_Content__c = payVideo, ProductId = premSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccPremMovPrem(){
        Case c = new Case(Streaming_Content__c = premVideo, ProductId = premSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }
    //Account Tier: Premium
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccPremMovInval(){
        Case c = new Case(Streaming_Content__c = brokeVideo, ProductId = premSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(sr.isSuccess());
    }



    //Invalid Account++++++++++++++++++++++++++++++++++++
    //Account Tier: Invalid
    //Movie Subscription Tier: Free
    @isTest
    public static void AccInvalMovFree(){
        Case c = new Case(Streaming_Content__c = freeVideo, ProductId = brokeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Pay
    @isTest
    public static void AccInvalMovPay(){
        Case c = new Case(Streaming_Content__c = payVideo, ProductId = brokeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Premium
    @isTest
    public static void AccInvalMovPrem(){
        Case c = new Case(Streaming_Content__c = premVideo, ProductId = brokeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }
    //Account Tier: Invalid
    //Movie Subscription Tier: Invalid
    @isTest
    public static void AccInvalMovInval(){
        Case c = new Case(Streaming_Content__c = brokeVideo, ProductId = brokeSub);
        Database.saveResult sr = Database.insert(c, false);
        system.assert(!sr.isSuccess());
    }



    //Check Video Reports Tests
    //---------------------------------------------------------------

    //Submit list of cases with just enough complaints; 10 (Positive)
    @isTest
    public static void EnoughComplaints(){
        badVideo = new Streaming_Content__c(Title__c='Steps on the Roof');
        for(Integer i = 0; i < 10; i++){
            Case c = new Case(Case_Subject__c='Video Quality', Streaming_Content__c=badVideo);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(badVideo.Needs_Review__c);
    }
    //Submit list of cases with not enough complaints; 8 (Negative)
    @isTest
    public static void NotEnoughComplaints(){
        badVideo = new Streaming_Content__c(Title__c='Under the Mistletoe');
        for(Integer i = 0; i < 8; i++){
            Case c = new Case(Case_Subject__c='Video Quality', Streaming_Content__c=badVideo);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(!badVideo.Needs_Review__c);
    }
    //Submit list of cases with too many complaints; 20 (Positive)
    @isTest
    public static void TooManyComplaints(){
        badVideo = new Streaming_Content__c(Title__c='Avalanche');
        for(Integer i = 0; i < 20; i++){
            Case c = new Case(Case_Subject__c='Video Quality', Streaming_Content__c=badVideo);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(badVideo.Needs_Review__c);
    }
    //Submit list of cases with no complaints; 0 (Negative)
    @isTest
    public static void NoComplaints(){
        badVideo = new Streaming_Content__c(Title__c='The Perfect Gift');
        for(Integer i = 0; i < 10; i++){
            Case c = new Case(Case_Subject__c='Technical', Streaming_Content__c=badVideo);
            allCases.add(c);
        }
        Database.insert(allCases, false);
        system.assert(!badVideo.Needs_Review__c);
    }
}
