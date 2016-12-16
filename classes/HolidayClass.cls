public class HolidayClass {
    
    @Auraenabled
    public static void getSaveHolidays(String holidayObject) {
        
        System.debug('######## '+holidayObject);
        HolidayWrpClass holidayVar = (HolidayWrpClass) System.JSON.deserialize(holidayObject, HolidayWrpClass.class);
        System.debug('holiday '+holidayVar);
        
        Holiday__c holidayInsert = new Holiday__c();
        holidayInsert.Name = holidayVar.HolidayName;
        holidayInsert.Distributor__c = holidayVar.parentID;
        holidayInsert.All_Day__c = holidayVar.AllDay;
        if(holidayVar.Description.length() > 0) {
            holidayInsert.Description__c = holidayVar.Description;
        }
        if(holidayVar.AllDay) {
            holidayInsert.Start__c = holidayVar.HolidayDate;
            holidayInsert.End__c = holidayVar.HolidayDate;
        } else {
            List< String > startHours = holidayVar.StartTime.split(':');
            List< String > endHours = holidayVar.EndTime.split(':');
            holidayInsert.Start__c = holidayVar.HolidayDate.addHours(Integer.ValueOf(startHours[0])).addMinutes(Integer.ValueOf(startHours[1]));
            holidayInsert.End__c = holidayVar.HolidayDate.addHours(Integer.ValueOf(endHours[0])).addMinutes(Integer.ValueOf(endHours[1]));
        }
        if(holidayVar.Recurring) {
            holidayInsert.Recurring_Holiday__c = holidayVar.RecurringText;
        }
        insert holidayInsert;
    }
}