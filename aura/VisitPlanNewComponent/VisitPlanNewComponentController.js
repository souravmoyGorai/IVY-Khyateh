({
	init: function(component, event, helper) {
    	document.title = "Visit Plans";
    },
    
    fetch : function(cmp, event, helper) {
    	var action = cmp.get("c.fetchVisits");
        var accid = cmp.get("v.accountIds");
        action.setParams({
        	 "accountId": accid
        });
		 action.setCallback(this, function(response) {
            var state = response.getState();
             if (cmp.isValid() && state === "SUCCESS") {
                 var res = response.getReturnValue();
           			 cmp.set("v.visits", res); 
                 	 cmp.set("v.fetchcheck", true);
             }
            
         });
		$A.enqueueAction(action);
	}, 
})