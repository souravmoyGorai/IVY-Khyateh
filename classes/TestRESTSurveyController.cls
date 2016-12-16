@isTest
private class TestRESTSurveyController {
    
    static testMethod void surveyControllerManager1() {
        
        String surveyString = RESTSurveyController.createNewSurvey('Test Survey', TRUE, 'surveyCode');
    }
}