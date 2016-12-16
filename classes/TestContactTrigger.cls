/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Test Class for contactTrigger and contactTriggerHandler
***********************************************************************/

@isTest
private class TestContactTrigger {

    static testMethod void newContactCreationTest() {
    	Test.startTest();
    		list<contact> testConList = TestDataUtility.createContactTestData('Seller');
    		Database.insert(testConList);
    	Test.stopTest();
        
    }
}