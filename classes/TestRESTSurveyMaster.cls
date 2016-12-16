@isTest
private class TestRESTSurveyMaster {
    
    static testMethod void surveyMasterManager1() {
        
        Survey__c s = new Survey__c();
        s.Name = 'Test survey';
        s.Active__c = TRUE;
        s.Survey_Code__c = 'surveyCode';
        insert s;
        
        List<SurveyDomain.SurveyMasterInfo> testSurveyManager = RESTSurveyMaster.getSurveyMaster();
    }
}