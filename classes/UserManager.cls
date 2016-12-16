@RestResource(urlMapping='/v1/user/*')
global with sharing class UserManager {
    @HttpGet
    global static List<ContactDomain.UserInfo> getUserInfo() {
        List<ContactDomain.UserInfo> userList;
        List<Contact> contactList = ContactService.getContactsByUserId(UserInfo.getUserId());
        System.debug(contactList);
        userList = ContactTranslator.objectToUserInfo(contactList);
        System.debug(userList);
        return userList;
    }
}