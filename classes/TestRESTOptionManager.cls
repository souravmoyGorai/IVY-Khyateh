@isTest
private class TestRESTOptionManager {

    static testMethod void optionManager() {
        
        List<RecordType> rtlist = [SELECT ID, DeveloperName, SObjectType  
                                        FROM RecordType 
                                    WHERE SObjectType = 'Account' 
                                    AND DeveloperName = 'Store'];
                                    
        Account acc = new Account (Name = 'test');
        if (rtlist != null && rtlist.size() > 0) {
            acc.recordtypeId = rtlist[0].Id;
        }
        insert acc;
        
        Contact con = new Contact (LastName = 'test');
        insert con;
        
        Survey__c servey = new Survey__c(Name = 'testservey');
        insert servey;
        
        Survey_Question__c sq = new Survey_Question__c(Question__c = 'what is your question?', From__c = system.now());
        insert sq;
        
        Survey_Result__c sr = new Survey_Result__c(Code__c = 'code123', Survey__c = servey.Id, Seller__c = con.Id, Store__c = acc.Id);
        insert sr;
        
        Survey_Result_Detail__c srd = new Survey_Result_Detail__c(Survey_Result__c = sr.Id, Survey_Question__c = sq.Id, Actual__c = '10');
        insert srd; 
        
        List<SurveyResultDetailDomain.SurveyResultDetailInfo> serveyResult = RESTOptionManager.getOptions();
        
    }
}