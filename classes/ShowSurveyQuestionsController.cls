Public with Sharing class ShowSurveyQuestionsController {
    
    public Survey__c survey { get; set; }
    public List<Survey_Question__c> surveyQuestionList { get; set; }
    
    public ShowSurveyQuestionsController() {
        this.survey = new Survey__c();
        this.survey.Store_Local_Channel__c = null;
        surveyQuestionList = new List<Survey_Question__c> ();
    }
    
    public void resetFilters() {
        this.survey = new Survey__c();
        this.survey.Store_Local_Channel__c = null;
        surveyQuestionList = new List<Survey_Question__c>();
    }
    
    public void searchSurveyQuestion() {
        surveyQuestionList = SurveyQuestionService.searchSurveyQuestionwithSurvey(this.survey);
        system.debug('list::::size'+surveyQuestionList.size());
    }
}