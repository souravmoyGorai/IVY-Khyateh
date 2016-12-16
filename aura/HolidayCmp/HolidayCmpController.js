({
    doInit : function(component, event) {
        var today = new Date();
        component.set('v.today', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
        var holObject = {};
        holObject.parentID = "0014100000Bqs2aAAB";	//component.get("v.recordId");
        holObject.HolidayName = "";
        holObject.Description = "";
        holObject.AllDay = false;
        holObject.Recurring = false;
        holObject.NoEndDate = false;
        holObject.StartTime = "00:00";
        holObject.EndTime = "00:00";
        component.set("v.holidayObject", holObject);
    },
    
    onFrequencyChange : function(component, event, helper) {
		var stage = event.getSource().get("v.text");
        component.set("v.selectedFreq", stage);
        component.set("v.alertMessage", "");
        $A.util.addClass(component.find("alert-id"), "showHide");
        if(stage === "Daily") {
            $A.createComponent(
                "c:DailySectionCmp",
                {
                    
                }, function(newCmp){
                    if (component.isValid()) {
                        component.set("v.body", newCmp);
                    }
                });
        } else if(stage === "Weekly") {
            $A.createComponent(
                "c:WeeklySectionCmp",
                {
                    
                }, function(newCmp){
                    if (component.isValid()) {
                        component.set("v.body", newCmp);
                    }
                });
        } else if(stage === "Monthly") {
            $A.createComponent(
                "c:MonthlySectionCmp",
                {
                    
                }, function(newCmp){
                    if (component.isValid()) {
                        component.set("v.body", newCmp);
                    }
                });
        } else if(stage === "Yearly") {
            $A.createComponent(
                "c:YearlySectionCmp",
                {
                    
                }, function(newCmp){
                    if (component.isValid()) {
                        component.set("v.body", newCmp);
                    }
                });
        }
	},
    
    checkAllDay : function(component, event) {
        if(event.getSource().get("v.value")) {
            component.find("time-from").set("v.disabled", true);
            component.find("time-to").set("v.disabled", true);
        } else {
            component.find("time-from").set("v.disabled", false);
            component.find("time-to").set("v.disabled", false);
        }
    },
    
    checkRecurring : function(component, event) {
        if(event.getSource().get("v.value")) {
            component.find("dateField").set("v.disabled", true);
            $A.util.removeClass(component.find("recur-section"), "showHide");
        } else {
            component.find("dateField").set("v.disabled", false);
            $A.util.addClass(component.find("recur-section"), "showHide");
        }
    },
    
    checkEndDate : function(component, event) {
        if(event.getSource().get("v.value")) {
            component.find("end-date").set("v.disabled", true);
        } else {
            component.find("end-date").set("v.disabled", false);
        }
    },
    
    cancel : function(component, event) {
        var dismissAction = $A.get("e.force:closeQuickAction");
        dismissAction.fire();
    },
    
    selectFromTime : function(component) {
        component.set("v.alertMessage", "");
        $A.util.addClass(component.find("alert-id"), "showHide");
    },
    
    selectToTime : function(component) {
        component.set("v.alertMessage", "");
        $A.util.addClass(component.find("alert-id"), "showHide");
    },
    
    saveForm : function(component, event, helper) {
        var form = component.get("v.holidayObject");
        form.HolidayDate = component.find("dateField").get("v.value");
        if(form.Recurring){
            var freqString = component.get("v.FreqString");
            if(freqString.length > 0) {
            	if(form.NoEndDate) {
                	form.RecurringText = freqString + " " + form.HolidayDate;
            	} else {
                    var endDate = component.find("end-date").get("v.value");
                    form.RecurringText = freqString + " " + form.HolidayDate + " until " + endDate;
            	}
                component.set("v.holidayObject", form);
                helper.nextProcess(component);
            } else {
                if(component.get("v.selectedFreq") === "None") {
                    component.set("v.alertMessage", "Please select any Frequency or uncheck Recurring Holiday");
                    $A.util.removeClass(component.find("alert-id"), "showHide");
                    return;
                }
            }
        } else {
            component.set("v.holidayObject", form);
            helper.nextProcess(component);
        }
    },
    
    updateFrequency : function(component, event) {
        var strVar = event.getParam("passValue");
        component.set("v.FreqString", strVar);
    },
    
    startDateChange : function(component) {
        var tempDate = component.find("dateField").get("v.value");
        component.find("start-date").set("v.value", tempDate);
    },
    
    startDateChange2 : function(component) {
        var tempDate = component.find("start-date").get("v.value");
        component.find("dateField").set("v.value", tempDate);
    }
})