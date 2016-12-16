global with sharing class CategoryDomain {
    
    /* Category */
    global class CategoryInfo {        
        global Integer CategoryId;
        global String CategoryName;
    }
    
    /* Brand */
    global class BrandInfo {
        
        global Decimal BrandId;
        global String BrandName;
        global Decimal CategoryId;
    }
    
    /* Channel */
    global class ChannelInfo {
        global Integer ChannelId;
        global String ChannelName;
    }
    
    /* Sub Channel */
    global class SubChannelInfo {
        global Integer ChannelId;
        global Integer SubChannelId;
        global String SubChannelName;
    }
}