@RestResource(urlMapping='/v1/option/*')
global with sharing class RESTOptionManager {
    
    @HttpGet
    global static List<SurveyResultDetailDomain.SurveyResultDetailInfo> getOptions() {
         List<SurveyResultDetailDomain.SurveyResultDetailInfo> optionsList = new List<SurveyResultDetailDomain.SurveyResultDetailInfo>();
         
         List<Survey_Result_Detail__c> serveyResultDetailList = SurveyResultDetailService.getAllSurveyResultDetail();
         if (serveyResultDetailList != null) {
             optionsList = SurveyResultDetailTranslator.objectToSurveyResultDetailInfo(serveyResultDetailList);
         }
         return optionsList;
    }
    /*@HttpGet
    global static String getOptions() {
         return 'optionsList';
    }*/
    
}