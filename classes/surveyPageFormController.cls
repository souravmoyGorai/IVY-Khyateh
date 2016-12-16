public with sharing class surveyPageFormController {
    @AuraEnabled
	public static List<Survey_Question__c> getSurveyQuestionList(Survey__c surveyval) {
        list<Survey__c> surveyList = [SELECT ID, Name FROM Survey__c WHERE Product_Category__c Like: '%'+surveyval.Product_Category__c+'%'];
        list<ID> surveyIDList = new list<ID>();
        list<Survey_Question__c> surveyQuesList = new list<Survey_Question__c>();
        
        if(surveyList.size() > 0) {
            for(Survey__c tempsurvey : surveyList) {
                surveyIDList.add(tempsurvey.ID);
            }
        }
        
        surveyQuesList = [SELECT ID, Question__c FROM Survey_Question__c WHERE Survey__c IN: surveyIDList];
        if(surveyQuesList.size() > 0)
            return surveyQuesList;
        return null;
    }
}