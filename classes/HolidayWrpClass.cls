public class HolidayWrpClass {
    
    @AuraEnabled
    public String parentID;
    
    @AuraEnabled
    public String HolidayName;
    
    @AuraEnabled
    public String Description;
    
    @AuraEnabled
    public Boolean AllDay;
    
    @AuraEnabled
    public Boolean Recurring;
    
    @AuraEnabled
    public Boolean NoEndDate;
    
    @AuraEnabled
    public DateTime HolidayDate;
    
    @AuraEnabled
    public String StartTime;
    
    @AuraEnabled
    public String EndTime;
    
    @AuraEnabled
    public String RecurringText;
    
    public HolidayWrpClass() {
        
    }
}