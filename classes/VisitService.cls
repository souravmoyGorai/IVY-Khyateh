public with sharing class VisitService {
    
    //Get all the Visit Records of an user
    public static List<Visit__c> getAllVisits(Id userId) {
        List<Visit__c> visitList = [SELECT
                                        Id, Original_Date__c, Route_Id__c
                                    FROM
                                        Visit__c
                                    WHERE
                                        Seller__r.Related_User__c = :userId];
        return visitList;
    }
}