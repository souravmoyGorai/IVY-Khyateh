/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Test Class for surveyPageFormController
***********************************************************************/

@isTest
private class TestSurveyPageFormController {

    static testMethod void myUnitTest() {
    	Test.startTest();
    		Survey__c testSurvey1 = TestDataUtility.createSurveyTestData('ADM','Old Spice','APDO','DP OTC','DP OTC');
    		Database.insert(testSurvey1);
    		Survey__c testSurvey2 = TestDataUtility.createSurveyTestData('Baby Care','Pampers','Diapers','DP OTC','DP OTC');
    		Database.insert(testSurvey2);
    		
    		Survey__c searchSurvey = new Survey__c(Product_Sub_Brand__c='', Product_Brand__c='', Product_Category__c='ADM', Store_Channel__c='', Name='');
    		surveyPageFormController.getSurveyQuestionList(searchSurvey);
    	Test.stopTest();
    }
}