global with sharing class SurveyDomain {
    global class SurveyInfo {
        public SurveyInfo() {
            this.Posm = new List<SurveyDomain.SurveyQuestionInfo>();
        }
        public List<SurveyQuestionInfo> Posm;
    }

    global class SurveyQuestionInfo {
        public String QuestionId;
        public String ListCode;
        public String QuestionDesc;
    }
    
    global class SurveyMasterInfo {
        public String SurveyId;
        public String SurveyDesc;
        public DateTime StartDate;
        public DateTime EndDate;
    }
}