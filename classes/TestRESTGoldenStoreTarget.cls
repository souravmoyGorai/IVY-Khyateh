@isTest
private class TestRESTGoldenStoreTarget {
    static testMethod void goldenStoreTargetManager1() {
        Survey_Target__c surveyTarget = new Survey_Target__c();
        
        List<Picklist_Value_Id_Config__c> pvidList = new List<Picklist_Value_Id_Config__c> {
            new Picklist_Value_Id_Config__c(Name = 'DP OTC', BrandId__c = 1, SubChannelId__c = 110, ChannelId__c = 101),
            new Picklist_Value_Id_Config__c(Name = 'Laundry', BrandId__c = 2, CategoryId__c = 102),
            new Picklist_Value_Id_Config__c(Name = 'Ariel ', BrandId__c = 3, CategoryId__c = 103)
        };
        insert pvidList;
        
        surveyTarget.Name = 'Test survey Target';
        surveyTarget.SubChannelCode__c = 'DP OTC';
        surveyTarget.CategoryCode__c = 'Laundry';
        surveyTarget.BrandCode__c = 'Ariel';
        insert surveyTarget;
        List<SurveyTargetDomain.goldenStoreTargetInfo> goldenST = RESTGoldenStoreTarget.getGoldenStoreTarget();
    }
}