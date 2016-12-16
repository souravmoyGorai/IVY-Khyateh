public with sharing class SurveyService {
    public static List<Survey__c> getAllActiveSurveys() {
        List<Survey__c> surveys;
        surveys = [Select Id,
                        Name, 
                        Survey_Code__c, 
                        From__c,
                        To__c,
                        (
                            SELECT
                                Id,
                                Question_Code__c,
                                Question_Type__c,
                                Name
                            FROM
                                Survey_Questions__r
                        )
                    FROM
                        Survey__c
                    WHERE 
                        Active__c = true];
        return surveys;
    }
}