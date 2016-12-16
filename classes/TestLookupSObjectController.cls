/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Test Class for LookupSObjectController
***********************************************************************/

@isTest
private class TestLookupSObjectController {

    static testMethod void myUnitTest() {
    	Test.startTest();
    		list<Account> testAccBrachList = TestDataUtility.createAccountTestData('Branch');
        	Database.insert(testAccBrachList);
        	
        	LookupSObjectController.lookup('Test', 'Account');
    	Test.stopTest();
    }
}