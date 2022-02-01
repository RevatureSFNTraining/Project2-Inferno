public with sharing class CaseTrigger_Helper {
    public CaseTrigger_Helper() {
    }

    //Ensure that a case is only created for
    //Streaming Content that the user can view
    public static void CheckAccountTier(List<Case> caseList){

        //Variables
        List<Product2> productList = [SELECT ID, Family FROM Product2];
        List<Streaming_Content__c> contentList = [SELECT ID, Tier__c FROM Streaming_Content__c];
        Streaming_Content__c complaintMovie;
        string complaintTier = 'Free';
        Product2 complaintProduct;
        ID complaintID;

        //For Every Case
        for (Case c: caseList){
            //Get the Streaming Content ID
            //Use the Streaming Content ID to find the movie
            for (Streaming_Content__c streamMovie : contentList){
                if (c.Streaming_Content__c == streamMovie.Id){
                    complaintMovie = streamMovie;
                }
            }
            //Get the Product ID Associated with the case
            //Use the Product ID to find the Subscription
            complaintID = c.ProductId;
            for (Product2 p : productList){
                if (complaintID == p.Id){
                    complaintProduct = p;
                }
            }
            //Ensure the Product ID is not null
            if (complaintProduct != null){
                complaintTier = complaintProduct.Family;
            }
            //If the Account is not of a correct Tier to view the Content
            //Mark the case with an error
            switch on complaintMovie.Tier__c {
                when 'Pay' {
                    if (complaintTier != 'Pay' && complaintTier != 'Premium'){
                        c.Streaming_Content__c.addError('You do not have access to that Streaming Content!');
                    }
                }
                when 'Premium' {
                    if (complaintTier != 'Premium'){
                        c.Streaming_Content__c.addError('You do not have access to that Premium Streaming Content!');
                    }
                }
                when else {
                    if (complaintMovie.Tier__c != 'Free'){
                        c.Streaming_Content__c.addError('Invalid Streaming Tier!');
                    }
                }
            }
        }
    }

    //Flag Streaming Content that's recieved numerous video quality reports
    public static void CheckVideoReports(List<Case> caseList){
        //Variables
        List<Streaming_Content__c> contentList = [SELECT ID, Needs_Review__c FROM Streaming_Content__c];
        Integer complaints;
        Integer complaintLimit = 10;
        ID videoId;
        Streaming_Content__c caseVideo;

        //For Every Case
        for(Case c: caseList){
            complaints = 0;
            videoId = c.Streaming_Content__c;
            for(Streaming_Content__c content : contentList){
                if (content.id == videoId){
                    caseVideo = content;
                }
            }
            for (Case c2: caseList){
                //Check how many other cases have issue with the same video
                if (c2.Streaming_Content__r == caseVideo){
                    //Check how many cases have marked Video Quality as the issue
                    if (c2.Case_Subject__c == 'Video Quality'){
                        complaints++;
                    }
                }
            }
            //If a video has enough complaints, mark for review
            if (complaints >= complaintLimit){
                caseVideo.Needs_Review__c = true;
                Database.update(caseVideo);
            }
        }
    }
}
