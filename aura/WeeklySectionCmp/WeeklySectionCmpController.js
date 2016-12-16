({
    doInit : function(component) {
        var temp = component.find("weekCheck-id");
        var dat = new Date();
        var toTemp = dat.getDay();
        temp[toTemp].set("v.value", true);
    },
    
    checkRecurring : function(component, event, helper) {
		var selectedDay = event.getSource().get("v.text");
        var days = component.get("v.selectedDays");
        if(event.getSource().get("v.value")) {
            days.push(component.get("v.weekdays")[selectedDay]);
        } else {
            for(var i=0;i<days.length;i++) {
                var newDays = [];
                if(days[i] === component.get("v.weekdays")[selectedDay]) {
                    
                } else {
                    newDays.push(days[i]);
                    days = newDays;
                }
            }
        }
        component.set("v.selectedDays", days);
        var strValue = "";
        for(var j=0; j<days.length; j=j+1) {
            strValue = strValue + days;
            if(j !== days.length - 1) {
                strValue = strValue + ",";
            }
        }
        var tempWeek = component.find("week-number").get("v.value");
        if(!isNaN(tempWeek) && tempWeek !== undefined && parseInt(tempWeek, 10) > 0) {
        	var event = $A.get("e.c:FrequencyEvent");
        	event.setParams({
				"passValue" : "occurs every "+ tempWeek + " week(s) on " + strValue
			});
        	event.fire();
        }
        alert(JSON.stringify(component.get("v.selectedDays")));
	}
})