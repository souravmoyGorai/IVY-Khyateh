@RestResource(urlMapping='/v1/surveycategory/*')
global with sharing class RESTCategoryManager {
    
    @HttpGet
    global static List<CategoryDomain.CategoryInfo> getSurveyCategories() {
    
        List<CategoryDomain.CategoryInfo> categoryInfoList = new List<CategoryDomain.CategoryInfo>();
        Set<String> categoriesNameSet = CategoryService.getAllCategories();
        List<Picklist_Value_Id_Config__c> categoryRecords = CategoryService.getCategoryIdsByName(categoriesNameSet);
        categoryInfoList = CategoryTranslator.objectToCategoryInfo(categoryRecords);
        
        return categoryInfoList;
    }

}