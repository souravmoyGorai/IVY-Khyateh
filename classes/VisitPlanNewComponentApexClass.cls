public with sharing class VisitPlanNewComponentApexClass {
    @AuraEnabled
    public static List<Visit_Plan__c> getPrevVisitPlans() {
        list<Visit_Plan__c> allVisitPlansList = [SELECT ID, Name, Accounts__c, Branch_Code__c, Distributor_Code__c, Frequency__c
                                                 FROM Visit_Plan__c];
        return allVisitPlansList;
    }
}