/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Utility class for creating test data for test classes
***********************************************************************/

@isTest
public with sharing class TestDataUtility {
	
	public static Integer testDataSize = 25;
	
    public static list<Contact> createContactTestData(String contactType) {
    	list<Contact> conList = new list<Contact>();
    	
    	for(Integer i = 0; i < testDataSize; i++) {
    		Contact con = new Contact();
    		con.Title		= 'Mr.';
    		con.FirstName	= 'TestConFstName' + i;
    		con.LastName	= 'TestConLstName' + i;
    		con.Email		= 'testContact' +i + '@testing.com';
    		con.RecordTypeID = Schema.SObjectType.Contact.getRecordTypeInfosByName().get(contactType).getRecordTypeId();
    		conList.add(con);
    	}
        return conList;
    }
    
    public static list<Account> createAccountTestData(String accountType) {
    	list<Account> accList = new list<Account>();
    	
    	for(Integer i = 0; i < testDataSize; i++) {
    		Account acc = new Account();
    		acc.Name = 'TestAccountName';
    		acc.RecordTypeID = Schema.SObjectType.Account.getRecordTypeInfosByName().get(accountType).getRecordTypeId();
    		accList.add(acc);
    	}
    	return accList;
    }
    
    public static Survey__c createSurveyTestData(String prodCat, String prodBrand, String prodSubBrand, String storeChannel, String storeSubChannel) {
    	Survey__c survey = new Survey__c();
    	survey.Name = 'TestSurvey';
    	survey.Survey_Code__c = 'TS001';
    	survey.From__c = DateTime.now();
    	survey.To__c = DateTime.now().addDays(7);
    	survey.Product_Category__c = prodCat;
    	survey.Product_Brand__c = prodBrand;
    	survey.Product_Sub_Brand__c = prodSubBrand;
    	survey.Store_Channel__c = storeChannel;
    	survey.Store_Local_Channel__c = storeSubChannel;
    	
    	return survey;
    }
}