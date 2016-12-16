({
    doInit : function(component) {
        component.find("day-id").set("v.value", "1");
        component.find("day2-id").set("v.value", "day");
        component.find("week-id").set("v.value", "1st");
    },
    
    onFrequencyChange1 : function(component, event) {
        var dayNum = component.find("day-id").get("v.value");
        var monthNum = component.find("monthText-id").get("v.value");
        if(!isNaN(monthNum) && monthNum !== undefined && monthNum.length > 0) {
            var event = $A.get("e.c:FrequencyEvent");
            event.setParams({
                "passValue" : "Occurs on day " + dayNum  + " of every " 
                + monthNum  + " month(s) effective "
            });
            event.fire();
        }
	},
    
    onFrequencyChange2 : function(component, event) {
        var dayNum = component.find("day2-id").get("v.value");
        var weekNum = component.find("week-id").get("v.value");
        var monthNum = component.find("monthText2-id").get("v.value");
        if(!isNaN(monthNum) && monthNum !== undefined && monthNum.length > 0 && dayNum !== "day" && dayNum !== undefined) {
            var event = $A.get("e.c:FrequencyEvent");
            event.setParams({
                "passValue" : "Occurs on the " + weekNum + " " + dayNum  + " of every " 
                + monthNum  + " month(s) effective "
            });
            event.fire();
        }
	}
})