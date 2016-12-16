@isTest
private class TestSubChannelManager {
    
    static testMethod void subChannelManager1() {
        
        List<Picklist_Value_Id_Config__c> pvidList = new List<Picklist_Value_Id_Config__c> {
            new Picklist_Value_Id_Config__c(Name = 'test1', BrandId__c = 1, CategoryId__c = 101),
            new Picklist_Value_Id_Config__c(Name = 'test2', BrandId__c = 2, CategoryId__c = 102),
            new Picklist_Value_Id_Config__c(Name = 'test3', BrandId__c = 3, CategoryId__c = 103)
        };
        insert pvidList;
        
        List<CategoryDomain.SubChannelInfo> testChannelManager = RESTSubChannelManager.getSurveySubChannels();
    }
}