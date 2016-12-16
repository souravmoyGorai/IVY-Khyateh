@RestResource(urlMapping='/v1/retailer/*')
global with sharing class RetailerManager {
    @HttpGet
    global static List<ContactDomain.RetailerInfo> getRetailerInfo() {
        List<ContactDomain.RetailerInfo> retailerList;
        List<Contact> contactList = ContactService.getContactsByUserId(UserInfo.getUserId());
        retailerList = ContactTranslator.objectToRetailerInfo(contactList);
        return retailerList;
    }
}