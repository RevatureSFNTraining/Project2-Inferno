public with sharing class CaseTrigger_Helper {
    public CaseTrigger_Helper() {
    }

    //Ensure that a case is only created for
    //Streaming Content that the user can view
    public static void CheckAccountTier(List<Case> caseList){

        //Variables
        List<Product2> productList = [SELECT ID, Family FROM Product2];
        Streaming_Content__c complaintMovie;
        string complaintTier = 'Free';
        Product2 complaintProduct;
        ID complaintID;

        //For Every Case
            //Get the Case's Streaming content
            //Get the Product ID Associated with the case
            //Use the Product ID to find the Subscription
        for (Case c: caseList){
            complaintMovie = c.Streaming_Content__r;    
            complaintID = c.ProductId;
            for (Product2 p : productList){
                if (complaintID == p.Id){
                    complaintProduct = p;
                }
            }
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
        Integer complaints;
        Integer complaintLimit = 10;
        Streaming_Content__c caseVideo;

        //For Every Case
        //Check how many other cases have issue with the same video
        //Check how many cases have marked Video Quality as the issue
        for(Case c: caseList){
            complaints = 0;
            caseVideo = c.Streaming_Content__r;
            for (Case c2: caseList){
                if (c2.Streaming_Content__r == caseVideo){
                    if (c2.Case_Subject__c == 'Video Quality'){
                        complaints++;
                    }
                }
            }
            //If a video has enough complaints, mark for review
            if (complaints >= complaintLimit){
                caseVideo.Needs_Review__c = true;
            }
        }
    }
}
