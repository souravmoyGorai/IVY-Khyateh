public with sharing class CategoryService {
    
    
    /* Category */
    public static Set<String> getAllCategories() {
        
        Set<String> categoryNameSet = new Set<String>();

        Schema.DescribeFieldResult fieldResult = Survey__c.Product_Category__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    
        for( Schema.PicklistEntry f : ple) {
            categoryNameSet.add(f.getValue());
        }
        
        return categoryNameSet;
    }
    
    public static List<Picklist_Value_Id_Config__c> getCategoryIdsByName(Set<String> categoryNameSet) {
    
        List<Picklist_Value_Id_Config__c> categoryList;
        categoryList = [SELECT 
                            Id, Name, CategoryId__c 
                        FROM Picklist_Value_Id_Config__c
                        WHERE 
                            Name IN:categoryNameSet
                            AND CategoryId__c != null
                        ORDER BY 
                            CategoryId__c ASC];
        
        return categoryList;
    }
    
    
    /* Brand */
    public static Set<String> getAllBrandNames() {
        
        Set<String> brandNameSet = new Set<String>();
        
        //Get picklist values.
        List<Schema.PicklistEntry> entries = Survey__c.Product_Brand__c.getDescribe().getPicklistValues();

        for(Schema.PicklistEntry entry : entries) {
            brandNameSet.add(entry.getValue());
        }
        
        return brandNameSet;
    }
    
    public static List<Picklist_Value_Id_Config__c> getBrandsByName(Set<String> brandNameSet) {
        List<Picklist_Value_Id_Config__c> brandList;
        brandList = [SELECT
                            BrandId__c, Name, CategoryId__c
                        FROM
                            Picklist_Value_Id_Config__c 
                        WHERE
                            Name IN:brandNameSet 
                            AND BrandId__c != null
                        ORDER BY
                            BrandId__c ASC];
        
        return brandList;
    }
    
    /* Channel */
    public static Set<String> getAllChannelNames() {

        Set<String> channelNameSet = new Set<String>();
        List<Schema.PicklistEntry> entries = Survey__c.Store_Channel__c.getDescribe().getPicklistValues();

        for( Schema.PicklistEntry entry : entries) {
            channelNameSet.add(entry.getValue());
        }

        return channelNameSet;
    }
    
    public static List<Picklist_Value_Id_Config__c> getChannelsByName(Set<String> channelNameSet) {
        List<Picklist_Value_Id_Config__c> channelList;
        channelList = [SELECT
                            Id, Name, ChannelId__c
                        FROM
                            Picklist_Value_Id_Config__c 
                        WHERE
                            Name IN:channelNameSet 
                            AND ChannelId__c != null
                        ORDER BY
                            ChannelId__c ASC];
        
        return channelList;
    }
    
    /* Sub Channel */
    public static Set<String> getAllSubChannelNames() {

        Set<String> subChannelNameSet = new Set<String>();
        List<Schema.PicklistEntry> entries = Survey__c.Store_Local_Channel__c.getDescribe().getPicklistValues();

        for( Schema.PicklistEntry entry : entries) {
            subChannelNameSet.add(entry.getValue());
        }

        return subChannelNameSet;
    }
    
    public static List<Picklist_Value_Id_Config__c> getSubChannelsByName(Set<String> subChannelNameSet) {
        List<Picklist_Value_Id_Config__c> subChannelList;
        subChannelList = [SELECT
                            ChannelId__c, Sub_Channel__c, SubChannelId__c
                        FROM
                            Picklist_Value_Id_Config__c 
                        WHERE
                            Sub_Channel__c IN:subChannelNameSet 
                            AND SubChannelId__c != null
                        ORDER BY
                            SubChannelId__c ASC];
                            
        return subChannelList;
    }
    
}