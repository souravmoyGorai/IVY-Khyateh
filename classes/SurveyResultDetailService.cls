public class SurveyResultDetailService {

    public static List<Survey_Result_Detail__c> getAllSurveyResultDetail() {
        List<Survey_Result_Detail__c> surveyResultDetailList = [SELECT Survey_Question__c,
                                                                    Survey_Question__r.Question_Id__c, Actual__c
                                                               FROM
                                                                   Survey_Result_Detail__c];
        return surveyResultDetailList;
    }
}