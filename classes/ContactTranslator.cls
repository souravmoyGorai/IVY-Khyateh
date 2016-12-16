global class ContactTranslator {
    global static List<ContactDomain.UserInfo> objectToUserInfo(List<Contact> contactList) {
        List<ContactDomain.UserInfo> contactInfoList = new List<ContactDomain.UserInfo>();
        for(Contact con : contactList) {
            ContactDomain.UserInfo userInfo = new ContactDomain.UserInfo();
            userInfo.DistributorId = con.Distributor_Code__c;
            userInfo.DistributorName = con.Account.Name;
            userINfo.BranchId = con.Branch_Code__c;
            userInfo.UserName = con.Related_User__r.UserName;
            userInfo.LoginId = con.Related_User__r.Name;
            userInfo.Timezone = con.Related_User__r.TimeZoneSidKey;
            userInfo.Address1 = con.MailingStreet;
            userInfo.UserType = con.Related_User__r.UserRole.Name;
            userInfo.CurrentDate = DateTime.now().format('dd/MM/yyyy');
            contactInfoList.add(userInfo);
        }
        return contactInfoList;
    }
    
    global static List<ContactDomain.RetailerInfo> objectToRetailerInfo(List<Contact> contactList) {
        List<ContactDomain.RetailerInfo> retailerInfoList = new List<ContactDomain.RetailerInfo>();
        for(Contact con : contactList) {
            ContactDomain.RetailerInfo retailerInfo = new ContactDomain.RetailerInfo();
            retailerInfo.SellerId = con.Id;
            retailerInfo.RetailerCode = con.Account.StoreCode__c;
            retailerInfo.RetailerName = con.Account.Name;
            retailerInfo.Address1 = con.MailingStreet;
            retailerInfo.BeatId = con.Account.Visit_Plan__c;
            retailerInfo.ChannelId = con.Account.Local_Channel_Code__c;
            retailerInfo.Latitude = con.Account.Lat_and_Long__Latitude__s;
            retailerInfo.Longitude = con.Account.Lat_and_Long__Longitude__s;
            retailerInfo.SubChannelId = con.Account.Sub_Channel_Code__c;
            retailerInfoList.add(retailerInfo);
        }
        return retailerInfoList;
    }
    
}