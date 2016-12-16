@isTest
public class TestCategoryTranslator {
    static testMethod void category1() {
         List<Picklist_Value_Id_Config__c> pvidList = new List<Picklist_Value_Id_Config__c> {
            new Picklist_Value_Id_Config__c(Name = 'test1', BrandId__c = 1, CategoryId__c = 101),
            new Picklist_Value_Id_Config__c(Name = 'test2', BrandId__c = 2, CategoryId__c = 102),
            new Picklist_Value_Id_Config__c(Name = 'test3', BrandId__c = 3, CategoryId__c = 103)
        };
        insert pvidList;
        List<Picklist_Value_Id_Config__c> picklistVals = new List<Picklist_Value_Id_Config__c> {
            new Picklist_Value_Id_Config__c(Name = 'test1', ChannelId__c = 1, SubChannelId__c = 101),
            new Picklist_Value_Id_Config__c(Name = 'test2', ChannelId__c = 2, SubChannelId__c = 102),
            new Picklist_Value_Id_Config__c(Name = 'test3', ChannelId__c = 3, SubChannelId__c = 103)
        };
        insert picklistVals;
        List<CategoryDomain.CategoryInfo> categoryList = CategoryTranslator.objectToCategoryInfo(pvidList);
        List<CategoryDomain.BrandInfo> brandList = CategoryTranslator.objectToBrandInfo(pvidList);
        List<CategoryDomain.ChannelInfo> channelList = CategoryTranslator.objectToChannelInfo(picklistVals);
        List<CategoryDomain.SubChannelInfo> subchannelList = CategoryTranslator.objectToSubChannelInfo(picklistVals);
    }
}