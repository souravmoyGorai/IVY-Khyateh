@RestResource(urlMapping='/FieldSurvey/*')
global with sharing class RESTSurveyController {


@HttpPost
    global static String createNewSurvey(String surveyName, Boolean active, String surveyCode) {
        System.debug('RII Rest1');
        Survey__c s = new Survey__c();
        s.Name = surveyName;
        s.Active__c = active;
        s.Survey_Code__c = surveyCode;
        insert s;
        
        return 'Survey Created for ivymobility using restapi '+s;
    }
    
}