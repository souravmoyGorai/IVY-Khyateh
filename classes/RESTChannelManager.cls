@RestResource(urlMapping='/v1/channel/*')
global with sharing class RESTChannelManager {

    @HttpGet
    global static List<CategoryDomain.ChannelInfo> getSurveyChannels() {
    
        List<CategoryDomain.ChannelInfo> channelInfoList = new List<CategoryDomain.ChannelInfo>();
        
        Set<String> channelNameSet = CategoryService.getAllChannelNames();
        List<Picklist_Value_Id_Config__c> channelRecords = CategoryService.getChannelsByName(channelNameSet);
        channelInfoList = CategoryTranslator.objectToChannelInfo(channelRecords);
        
        return channelInfoList;
    }

}