/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Test Class for visitplancontroller
***********************************************************************/

@isTest
private class TestVisitPlanController {

    static testMethod void myUnitTest() {
        Test.startTest();
        	list<Account> testAccBrachList = TestDataUtility.createAccountTestData('Branch');
        	Database.insert(testAccBrachList);
        	list<Contact> testConList = TestDataUtility.createContactTestData('Seller');
        	for(Contact tempSeller : testConList)
        		tempSeller.AccountID = testAccBrachList[0].ID;
    		Database.insert(testConList);
        	list<Account> testAccStoreList = TestDataUtility.createAccountTestData('Store');
        	for(Account tempStore : testAccStoreList) {
        		tempStore.Parent_Branch__c = testAccBrachList[0].ID;
        		tempStore.Seller_Name__c = testConList[0].ID; 
        	}
        	Database.insert(testAccStoreList);
    		
        	visitplancontroller vpc = new visitplancontroller();
        	visitplancontroller.fetchVisits(testAccBrachList[0].ID,testConList[0].ID);
        	String newVisitPlan = '[{"accID":"'+testAccStoreList[0].ID+'","accName":"'+testAccStoreList[0].Name+'","conID":"'+testConList[0].ID+'","conName":"'+testConList[0].Name+'","fri":false,"mon":true,"sat":false,"sun":false,"thur":false,"tue":true,"vpid":"","wed":false,"week1":true,"week2":false,"week3":false,"week4":false,"week5":false}]';
        	visitplancontroller.savevisitplan(newVisitPlan);
        	visitplancontroller.fetchVisits(testAccBrachList[0].ID,testConList[0].ID);
        	visitplancontroller.fetchAllVisits(testAccBrachList[0].ID);
        Test.stopTest();
    }
}