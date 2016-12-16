@isTest
private class TestRestCategoryManager {
    static testMethod void categoryManager1() {
        List<Picklist_Value_Id_Config__c> pvidList = new List<Picklist_Value_Id_Config__c> {
            new Picklist_Value_Id_Config__c(Name = 'test4', BrandId__c = 1, CategoryId__c = 101),
            new Picklist_Value_Id_Config__c(Name = 'test5', BrandId__c = 2, CategoryId__c = 102),
            new Picklist_Value_Id_Config__c(Name = 'test6 ', BrandId__c = 3, CategoryId__c = 103)
        };
        insert pvidList;
        List<CategoryDomain.CategoryInfo> categoryTrans = CategoryTranslator.objectToCategoryInfo(pvidList);
        
        List<CategoryDomain.CategoryInfo> catelist = RESTCategoryManager.getSurveyCategories();
    }
}