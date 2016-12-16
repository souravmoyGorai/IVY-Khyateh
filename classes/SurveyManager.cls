@RestResource(urlMapping='/survey/v1.0/*')
global with sharing class SurveyManager {
    @HttpGet
    global static List<SurveyDomain.SurveyInfo> getRecords() {
        List<SurveyDomain.SurveyInfo> surveyInfos = null;
        List<Survey__c> surveys = SurveyService.getAllActiveSurveys();
        surveyInfos = SurveyTranslator.ObjectToDomain(surveys);
        /*CommonDomain.ServiceResponse response = new CommonDomain.ServiceResponse();
        response.status='SUCCESS';
        response.message = 'Fetched records successfully';
        response.records = surveyInfos;*/
        return surveyInfos;
    }
}