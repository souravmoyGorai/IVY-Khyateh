/**********************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Test File     : Yes
    @ Function      : Test Class for HolidayClass
***********************************************************************/

@isTest
private class TestHolidayClass {

    static testMethod void myUnitTest() {
    	Test.startTest();
    		list<Account> testAccBrachList = TestDataUtility.createAccountTestData('Branch');
        	Database.insert(testAccBrachList);
        	
        	String newHoliday = '{"parentID":"'+testAccBrachList[0].ID+'","HolidayName":"Test Holiday","Description":"Test Holiday","AllDay":true,"Recurring":false,"NoEndDate":false,"StartTime":"00:00","EndTime":"00:00","HolidayDate":"2016-12-31"}';
        	HolidayClass.getSaveHolidays(newHoliday);
        	newHoliday = '{"parentID":"'+testAccBrachList[0].ID+'","HolidayName":"Test Holiday","Description":"Test Holiday","AllDay":false,"Recurring":false,"NoEndDate":false,"StartTime":"00:10","EndTime":"10:00","HolidayDate":"2016-12-31"}';
        	HolidayClass.getSaveHolidays(newHoliday);
    	Test.stopTest();
    }
}