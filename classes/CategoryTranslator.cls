public with sharing class CategoryTranslator {
    
    /* Category */
    public static List<CategoryDomain.CategoryInfo> objectToCategoryInfo(List<Picklist_Value_Id_Config__c > categoriesList) {
        
        List<CategoryDomain.CategoryInfo> categoryInfoList = new List<CategoryDomain.CategoryInfo>();
        for(Picklist_Value_Id_Config__c category : categoriesList) {
            CategoryDomain.CategoryInfo categoryInfo = new CategoryDomain.CategoryInfo();
            categoryInfo.CategoryId = Integer.valueOf(category.CategoryId__c);              
            categoryInfo.CategoryName = category.Name;            
            categoryInfoList.add(categoryInfo);
        }
        return categoryInfoList;
    }
    
    
    /* Brand */
    public static List<CategoryDomain.BrandInfo> objectToBrandInfo(List<Picklist_Value_Id_Config__c> brandList) {
        
        List<CategoryDomain.BrandInfo> brandInfoList = new List<CategoryDomain.BrandInfo>();
        
        for(Picklist_Value_Id_Config__c brand : brandList) {            
            CategoryDomain.BrandInfo brandInfo = new CategoryDomain.BrandInfo();
            brandInfo.BrandId = Integer.valueOf(brand.BrandId__c);
            brandInfo.BrandName = brand.Name;
            brandInfo.CategoryId = Integer.valueOf(brand.CategoryId__c);
            
            brandInfoList.add(brandInfo);
        }
        
        return brandInfoList;
    }
    
    /* Channel */
    public static List<CategoryDomain.ChannelInfo> objectToChannelInfo(List<Picklist_Value_Id_Config__c> channelList) {
        
        List<CategoryDomain.ChannelInfo> channelInfoList = new List<CategoryDomain.ChannelInfo>();
        
        for(Picklist_Value_Id_Config__c channel : channelList) {            
            CategoryDomain.ChannelInfo channelInfo = new CategoryDomain.ChannelInfo();
            channelInfo.ChannelId = Integer.valueOf(channel.ChannelId__c);
            channelInfo.ChannelName = channel.Name;

            channelInfoList.add(channelInfo);
        }
        
        return channelInfoList;
    }
    
    /* Sub Channel */
    public static List<CategoryDomain.SubChannelInfo> objectToSubChannelInfo(List<Picklist_Value_Id_Config__c> subChannelList) {
        
        List<CategoryDomain.SubChannelInfo> subChannelInfoList = new List<CategoryDomain.SubChannelInfo>();
        
        for(Picklist_Value_Id_Config__c subChannel : subChannelList) {            
            CategoryDomain.SubChannelInfo subChannelInfo = new CategoryDomain.SubChannelInfo();
            subChannelInfo.SubChannelName = subChannel.Sub_Channel__c;
            subChannelInfo.SubChannelId = Integer.valueOf(subChannel.SubChannelId__c);
            subChannelInfo.ChannelId = Integer.valueOf(subChannel.ChannelId__c);

            subChannelInfoList.add(subChannelInfo);
        }
        
        return subChannelInfoList;
    }
    
}