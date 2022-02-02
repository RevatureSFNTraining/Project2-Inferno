public with sharing class StreamingContentHelper {
    public StreamingContentHelper() {

    }

    @AuraEnabled
    (cacheable = true)
    public static List<Streaming_Content__c> getMovieList (){
        try {
            return [SELECT ID, Title__c, Video_URL__c, Viewer_Rating__c, Genre__c, Needs_Review__c, Recommended_Age_Audience__c, Synopsis__c, Tier__c, Year__c
                    FROM Streaming_Content__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
