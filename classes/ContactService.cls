public class ContactService {
    public static List<Contact> getContactsByUserId(Id userId) {
        List<Contact> contactList = [
                                        SELECT
                                            Id,
                                            Distributor_Code__c,
                                            Account.Name,
                                            Branch_Code__c,
                                            Name,
                                            Related_User__r.Name,
                                            Related_User__r.TimeZoneSidKey,
                                            MailingStreet,
                                            MobilePhone,
                                            Related_User__r.UserRole.Name,
                                            Related_User__r.UserName,
                                            Account.StoreCode__c,
                                            Account.Visit_Plan__c,
                                            Account.Sub_Channel_Code__c,
                                            Account.Local_Channel_Code__c,
                                            Account.Lat_and_Long__Latitude__s,
                                            Account.Lat_and_Long__Longitude__s
                                        FROM
                                            Contact
                                        WHERE
                                            Related_User__c = :userId
                                            
        ];
        return contactList;
    }
}