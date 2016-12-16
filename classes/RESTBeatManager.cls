@RestResource(urlMapping='/v1/beat/*')
global with sharing class RESTBeatManager {
    
    @HttpGet
    global static List<VisitDomain.VisitInfo> getBeats() {
        List<VisitDomain.VisitInfo> visitInfoList = new List<VisitDomain.VisitInfo>();
        visitInfoList = VisitTranslator.objectToVisitInfo(VisitService.getAllVisits(UserInfo.getUserId()));
        return visitInfoList;
    }
}