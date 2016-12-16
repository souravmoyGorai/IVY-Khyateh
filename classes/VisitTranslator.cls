public with sharing class VisitTranslator {
    
    public static List<VisitDomain.VisitInfo> objectToVisitInfo(List<Visit__c> visitList) {
        List<VisitDomain.VisitInfo> visitInfoList = new List<VisitDomain.VisitInfo>();
        for(Visit__c visit : visitList) {
            VisitDomain.VisitInfo visitInfo = new VisitDomain.VisitInfo();
            visitInfo.RouteId = Integer.valueOf(visit.Route_Id__c);
            visitInfo.RouteName = VisitTranslator.getRouteName(visit);
            visitInfo.TodayRoute = VisitTranslator.getTodayRoute(visit);
            visitInfoList.add(visitInfo);
        }
        
        return visitInfoList;
    }
    
    public static String getRouteName(Visit__c visit) {
        String day = '';
        if(visit.Original_Date__c != null) {
            day = DateTime.newInstance(visit.Original_Date__c, Time.newInstance(0, 0, 0, 0)).format('EEEE');
        }
        return day;
    }
    
    public static Integer getTodayRoute(Visit__c visit) {
        if(visit.Original_Date__c != null) {
            if(visit.Original_Date__c.isSameDay(System.today())) {
                return 1;
            }
        }
        return 0;
    }
}