({
	init: function(component, event, helper) {
       document.title = "Search Surveys";
    },
    
    searchvalues: function(component, event, helper){
    	var action = component.get('c.getSurveyQuestionList');
        var sr = component.get("v.surveySearch");
        console.log(JSON.stringify(sr));
        action.setParams({ "surveyval" : sr});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS")
            {
                component.set("v.surveyQuestionList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})