public with sharing class SurveyTranslator {
    public static List<SurveyDomain.SurveyInfo> ObjectToDomain(List<Survey__c> surveys) {
        List<SurveyDomain.SurveyInfo> surveyInfos = new List<SurveyDomain.SurveyInfo>();
        for(Survey__c survey : surveys) {
            surveyInfos.add(ObjectToDomain(survey));
        }
        return surveyInfos;
    }

    public static SurveyDomain.SurveyInfo ObjectToDomain(Survey__c survey) {
        SurveyDomain.SurveyInfo surveyInfo = new SurveyDomain.SurveyInfo();
        surveyInfo.Posm = new List<SurveyDomain.SurveyQuestionInfo>();
        for(Survey_Question__c question : survey.Survey_Questions__r) {
            surveyInfo.Posm.add(ObjectToDomain(question));
        }
        return surveyInfo;
    }
    
    public static SurveyDomain.SurveyQuestionInfo ObjectToDomain(Survey_Question__c question) {
        SurveyDomain.SurveyQuestionInfo questionInfo = new SurveyDomain.SurveyQuestionInfo();
        questionInfo.QuestionId = question.Question_Code__c;
        questionInfo.QuestionDesc = question.Name;
        questionInfo.ListCode = (question.Question_Type__c=='Yes/No')? 'Option':'Text';
        return questionInfo;
    }
    
    public static List<SurveyDomain.SurveyMasterInfo> objectToSurveyMasterInfo(List<Survey__c> surveys) {
        List<SurveyDomain.SurveyMasterInfo> surveyMasterInfos = new List<SurveyDomain.SurveyMasterInfo>();
        for (Survey__c survey: surveys) {
            SurveyDomain.SurveyMasterInfo surveyInfo = new SurveyDomain.SurveyMasterInfo();
            surveyInfo.SurveyId = survey.Survey_Code__c;
            surveyInfo.SurveyDesc = survey.Name;
            surveyInfo.StartDate = survey.From__c;
            surveyInfo.EndDate = survey.To__c;
            surveyMasterInfos.add(surveyInfo);
        } 
        return surveyMasterInfos;
    }
}