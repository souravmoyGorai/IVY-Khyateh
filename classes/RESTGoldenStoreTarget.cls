@RestResource(urlMapping='/v1/goldenstoretarget/*')
global with sharing class RESTGoldenStoreTarget {
    
    @HttpGet
    global static List<SurveyTargetDomain.goldenStoreTargetInfo> getGoldenStoreTarget() {
         List<SurveyTargetDomain.goldenStoreTargetInfo> surveyTargetList = new List<SurveyTargetDomain.goldenStoreTargetInfo>();
         
         List<Survey_Target__c> surveyTargetQueryList = SurveyTargetService.getAllSurveyTarget();
         if (surveyTargetQueryList != null) {
             surveyTargetList = SurveyTargetTranslator.objectToSurveyTargetInfo(surveyTargetQueryList);
         }
         return surveyTargetList ;
    }    
}