({
    doInit: function(component) {
        component.find("radio1-id").set("v.value", true);
        var event = $A.get("e.c:FrequencyEvent");
        event.setParams({
			"passValue" : "Occurs every weekday effective"
		});
        event.fire();
    },
    
	onFrequencyChange1 : function(component) {
        var event = $A.get("e.c:FrequencyEvent");
        event.setParams({
			"passValue" : "Occurs every weekday effective"
		});
        event.fire();
	},
    
    onFrequencyChange2 : function(component) {
        var days = component.find("daily-days").get("v.value");
        if(!isNaN(days) && days !== undefined && parseInt(days, 10) > 0) {
        	var event = $A.get("e.c:FrequencyEvent");
        	event.setParams({
				"passValue" : "every "+days+" day(s)",
            	"passDays" : days
			});
        	event.fire();
        }
	}
})