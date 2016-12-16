global with sharing class CommonDomain {
    global class ServiceResponse {
        global String status;
        global String message;
        global List<SurveyDomain.SurveyInfo> records;
    }
}