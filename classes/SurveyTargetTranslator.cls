public with sharing class SurveyTargetTranslator {

    public static List<SurveyTargetDomain.goldenStoreTargetInfo> objectToSurveyTargetInfo(List<Survey_Target__c> surveyTargets) {
        List<SurveyTargetDomain.goldenStoreTargetInfo> surveyTargetInfos = new List<SurveyTargetDomain.goldenStoreTargetInfo>();
        
        Map<String, Decimal> channelNameIdMap = new Map<String, Decimal>();
        Map<String, Decimal> categoryNameIdMap = new Map<String, Decimal>();
        Map<String, Decimal> brandNameIdMap = new Map<String, Decimal>();
        
        Set<String> channelNameSet = CategoryService.getAllChannelNames();
        if (channelNameSet != null && channelNameSet.size() > 0) {
            channelNameIdMap = SurveyTargetTranslator.getPicklistValueIdMap(CategoryService.getChannelsByName(channelNameSet), 'channel');
        }
        
        Set<String> categoriesNameSet = CategoryService.getAllCategories();
        if (categoriesNameSet != null && categoriesNameSet.size() > 0) {
            categoryNameIdMap = SurveyTargetTranslator.getPicklistValueIdMap(CategoryService.getCategoryIdsByName(categoriesNameSet), 'category');
        }
        
        Set<String> brandNameSet = CategoryService.getAllBrandNames();
        if (brandNameSet != null && brandNameSet.size() > 0) {
            brandNameIdMap = SurveyTargetTranslator.getPicklistValueIdMap(CategoryService.getBrandsByName(brandNameSet), 'brand');
        }
        
        for (Survey_Target__c surTarget: surveyTargets) {
            SurveyTargetDomain.goldenStoreTargetInfo surveyTargetInfo = new SurveyTargetDomain.goldenStoreTargetInfo();
            if (surTarget.SubChannelCode__c != null && channelNameIdMap.containsKey(surTarget.SubChannelCode__c)) {
                surveyTargetInfo.ChannelId = channelNameIdMap.get(surTarget.SubChannelCode__c);
            }
            if (surTarget.CategoryCode__c != null && categoryNameIdMap.containsKey(surTarget.CategoryCode__c)) {
                surveyTargetInfo.CategoryId = categoryNameIdMap.get(surTarget.CategoryCode__c);
            }
            if (surTarget.BrandCode__c != null && brandNameIdMap.containsKey(surTarget.BrandCode__c)) {
                surveyTargetInfo.BrandId = brandNameIdMap.get(surTarget.BrandCode__c);
            }
            surveyTargetInfo.Target = surTarget.Target__c;
            surveyTargetInfos.add(surveyTargetInfo);
        } 
        return surveyTargetInfos;
    }
    
    public static Map<String, Decimal> getPicklistValueIdMap(List<Picklist_Value_Id_Config__c> picklistValueIds, String picklistType) {
        Map<String, Decimal> responsePicklistNameIdMap = new Map<String, Decimal>();
        
        if (picklistValueIds != null && picklistValueIds.size() > 0) {
            for (Picklist_Value_Id_Config__c pvid :picklistValueIds) {
                if (picklistType == 'channel' && pvid.ChannelId__c != null) {
                    responsePicklistNameIdMap.put(pvid.Name, pvid.ChannelId__c);
                } else if (picklistType == 'category' && pvid.CategoryId__c != null) {
                    responsePicklistNameIdMap.put(pvid.Name, pvid.CategoryId__c);
                } else if (picklistType == 'brand' && pvid.BrandId__c != null) {
                    responsePicklistNameIdMap.put(pvid.Name, pvid.BrandId__c);
                }
            }   
        }
        return responsePicklistNameIdMap;
    }
}