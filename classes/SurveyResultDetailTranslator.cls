public with sharing class SurveyResultDetailTranslator {
    public static List<SurveyResultDetailDomain.SurveyResultDetailInfo> objectToSurveyResultDetailInfo(List<Survey_Result_Detail__c> surveyResultDetailList) {
        List<SurveyResultDetailDomain.SurveyResultDetailInfo> surveyResultDetailInfoList = new List<SurveyResultDetailDomain.SurveyResultDetailInfo>();
        
        for(Survey_Result_Detail__c surveyResultDetail : SurveyResultDetailList) {
            SurveyResultDetailDomain.SurveyResultDetailInfo surveyResultDetailInfo = new SurveyResultDetailDomain.SurveyResultDetailInfo();
            if (surveyResultDetail.Survey_Question__c != null && surveyResultDetail.Survey_Question__r.Question_Id__c != null) {
                surveyResultDetailInfo.QuestionId = Integer.valueOf(surveyResultDetail.Survey_Question__r.Question_Id__c);
            }
            surveyResultDetailInfo.Answer = surveyResultDetail.Actual__c;
            surveyResultDetailInfoList.add(surveyResultDetailInfo);
        }
        return SurveyResultDetailInfoList;
    }
}