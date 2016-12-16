@isTest
private class TestRESTBeatManager {
    
    static testMethod void beatManager1() {
        Contact con = new Contact(LastName = 'TestLast', Related_User__c = UserInfo.getUserId());
        insert con;
        
        List<Visit__c> visitList = new List<Visit__c> {
            new Visit__c(Seller__c = con.Id, Original_Date__c = date.today()),
            new Visit__c(Seller__c = con.Id, Original_Date__c = date.today()),
            new Visit__c(Seller__c = con.Id, Original_Date__c = date.today()),
            new Visit__c(Seller__c = con.Id, Original_Date__c = date.today())
        };
        insert visitList;
        VisitDomain.VisitInfo vi = new VisitDomain.VisitInfo();
        vi.RouteId = 1;
        vi.TodayRoute = 3;
        vi.RouteName = 'test';       
        List<VisitDomain.VisitInfo> visitInfoList = RESTBeatManager.getBeats();
    }
}