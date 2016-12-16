@RestResource(urlMapping='/v1/subchannel/*')
global class RESTSubChannelManager {

    @HttpGet
    global static List<CategoryDomain.SubChannelInfo> getSurveySubChannels() {

        List<CategoryDomain.SubChannelInfo> subChannelInfoList = new List<CategoryDomain.SubChannelInfo>();

        Set<String> subChannelNameSet = CategoryService.getAllSubChannelNames();
        List<Picklist_Value_Id_Config__c> subChannelRecords = CategoryService.getSubChannelsByName(subChannelNameSet);
        subChannelInfoList = CategoryTranslator.objectToSubChannelInfo(subChannelRecords);

        return subChannelInfoList;
    }
}