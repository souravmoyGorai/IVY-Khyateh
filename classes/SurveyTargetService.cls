public with sharing class SurveyTargetService {
     public static List<Survey_Target__c> getAllSurveyTarget() {
        List<Survey_Target__c> surveyTargets;
        surveyTargets = [ SELECT Id,
                            SubChannelCode__c,
                            CategoryCode__c,
                            BrandCode__c, 
                            Target__c
                          FROM
                            Survey_Target__c];
        return surveyTargets;
    }
}