public class SurveyQuestionService {
    public static List<Survey_Question__c> searchSurveyQuestionwithSurvey(Survey__c survey) {
        String productCategory = survey.Product_Category__c;
        String productBrand = survey.Product_Brand__c;
        String subBrand = survey.Product_Sub_Brand__c;
        String storeChannel = survey.Store_Channel__c;
        String localChannel = survey.Store_Local_Channel__c;
        
        
        String surveyQueryStr = 'SELECT '
                                        + 'Id, '
                                        + 'Name, '
                                        + 'Survey__c, '
                                        + 'Survey__r.Name, '
                                        + 'Survey__r.Product_Category__c, '
                                        + 'Survey__r.Product_Brand__c, '
                                        + 'Survey__r.Product_Sub_Brand__c, '
                                        + 'Survey__r.Store_Channel__c, '
                                        + 'Survey__r.Store_Local_Channel__c, '
                                        + 'Question__c, '
                                        + 'Question_Code__c, '
                                        + 'Question_Id__c, '
                                        + 'Question_Type__c, '
                                        + 'Target__c, '
                                        + 'Weightage__c, '
                                        + 'From__c, '
                                        + 'To__c '
                                + 'FROM '
                                    + 'Survey_Question__c '
                                + 'WHERE '
                                    + 'Survey__c != NULL ';
        if(survey != null) {
            if (productCategory != null) {
                surveyQueryStr += ' AND Survey__r.Product_Category__c = :productCategory';
            }
            if (productBrand != null) {
                surveyQueryStr += ' AND Survey__r.Product_Brand__c = :productBrand ';
            }
            if (subBrand != null) {
                surveyQueryStr += ' AND Survey__r.Product_Sub_Brand__c = :subBrand ';
            }
            if (storeChannel != null) {
                surveyQueryStr += ' AND Survey__r.Store_Channel__c = :storeChannel ';
            }
            if (localChannel != null) {
                surveyQueryStr += ' AND Survey__r.Store_Local_Channel__c = :localChannel ';
            }
        }
        surveyQueryStr += ' LIMIT 1000';
        
        return Database.Query(surveyQueryStr);
    }
}