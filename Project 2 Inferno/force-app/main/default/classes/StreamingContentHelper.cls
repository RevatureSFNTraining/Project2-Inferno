public with sharing class StreamingContentHelper {
    public StreamingContentHelper() {

    }

    @AuraEnabled
    (cacheable = true)
    public static List<Streaming_Content__c> getMovieList (String genreSearch){
        try {
            return [SELECT ID, Title__c, Video_URL__c, Viewer_Rating__c, Genre__c, Needs_Review__c, Recommended_Age_Audience__c, Synopsis__c, Tier__c, Year__c
                    FROM Streaming_Content__c
                    WHERE Genre__c = genreSearch
                    LIMIT 6];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    (cacheable = true)
    public static List<Streaming_Content__c> getMovieSearchList (String genreSearch, String searchString){
        try {
            return [SELECT ID, Title__c, Video_URL__c, Viewer_Rating__c, Genre__c, Needs_Review__c, Recommended_Age_Audience__c, Synopsis__c, Tier__c, Year__c
                    FROM Streaming_Content__c
                    WHERE Genre__c = genreSearch && Title__c LIKE searchString
                    LIMIT 6];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
