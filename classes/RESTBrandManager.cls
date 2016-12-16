@RestResource(urlMapping='/v1/surveybrand/*')
global with sharing class RESTBrandManager {
    
    @HttpGet
    global static List<CategoryDomain.BrandInfo> getSurveyBrand() {
        
        List<CategoryDomain.BrandInfo> brandInfoList = new List<CategoryDomain.BrandInfo>();

        Set<String> brandNameSet = CategoryService.getAllBrandNames();
        List<Picklist_Value_Id_Config__c> brandRecords = CategoryService.getBrandsByName(brandNameSet);
        brandInfoList = CategoryTranslator.objectToBrandInfo(brandRecords);

        return brandInfoList;
    }

}