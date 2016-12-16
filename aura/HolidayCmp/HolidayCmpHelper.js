({
	saveHoliday : function(component) {
		var action = component.get("c.getSaveHolidays");
        action.setParams({
            "holidayObject" : JSON.stringify(component.get("v.holidayObject"))
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                
            }
        });
        $A.enqueueAction(action);
	},
    
    nextProcess : function(component) {
        var form = component.get("v.holidayObject");
        if(form.AllDay) {
            component.set("v.holidayObject", form);
            this.saveHoliday(component);
        } else {
            var startTime = form.StartTime;
            var endTime = form.EndTime;
            var startHours = String(startTime).split(':');
            var endHours = String(endTime).split(":");
            if(parseInt(startHours[0], 10) > parseInt(endHours[0], 10)) {
                component.set("v.alertMessage", "From Time should be less than To Time");
                $A.util.removeClass(component.find("alert-id"), "showHide");
                return;
            } else if(parseInt(startHours[0], 10) === parseInt(endHours[0], 10)) {
                if(parseInt(startHours[1], 10) > parseInt(endHours[1], 10)) {
                    component.set("v.alertMessage", "From Time should be less than To Time");
                    $A.util.removeClass(component.find("alert-id"), "showHide");
                    return;
                }
            } else {
                component.set("v.holidayObject", form);
            	this.saveHoliday(component);
            }
        }
    }
})