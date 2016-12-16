@RestResource(urlMapping='/v1/surveymaster/*')
global with sharing class RESTSurveyMaster {
    
    @HttpGet
    global static List<SurveyDomain.SurveyMasterInfo> getSurveyMaster() {
         List<SurveyDomain.SurveyMasterInfo> surveyMasterList = new List<SurveyDomain.SurveyMasterInfo>();
         
         List<Survey__c> serveyList = SurveyService.getAllActiveSurveys();
         if (serveyList  != null) {
             surveyMasterList = SurveyTranslator.objectToSurveyMasterInfo(serveyList);
         }
         return surveyMasterList;
    }    
}