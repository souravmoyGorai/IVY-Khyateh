({
    /**
     * Handler for receiving the updateLookupIdEvent event
     */
    handleAccountIdUpdate: function(cmp, event, helper) {
        // Get the Id from the Event
        var rcdId = event.getParam("sObjectId");
        var sobjectName = event.getParam("objectName");

        // Set the Id bound to the View
        if (sobjectName == "Account") {
            cmp.set('v.accountIds', rcdId);
        }

        if (sobjectName == "Contact") {
            cmp.set('v.contactIds', rcdId);
        }

    },

    /**
     * Handler for receiving the clearLookupIdEvent event
     */
    handleAccountIdClear: function(cmp, event, helper) {
        // Clear the Id bound to the View
        cmp.set('v.recordId', null);
    },

    fetch: function(cmp, event, helper) {
        var action = cmp.get("c.fetchVisits");
        var accid = cmp.get("v.accountIds");
        var conid = cmp.get("v.contactIds");
        action.setParams({
            "accountId": accid,
            "contactId": conid
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
        
        /*
        var getVisitsAction = cmp.get("c.fetchAllVisits");
        var getVisitsaccID = cmp.get("v.accountIds");
        getVisitsAction.setParams({
            "accountId": getVisitsaccID
        });
        getVisitsAction.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                var res = response.getReturnValue();
                cmp.set("v.prevVisitPlanList", res);
            }
        });
        $A.enqueueAction(getVisitsAction);
        */
    },

    saveplan: function(cmp, event, helper) {
        var action = cmp.get("c.savevisitplan");
        var wcc = cmp.get("v.visits");
        console.log(wcc);
        action.setParams({
            "wcs": JSON.stringify(wcc)
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                alert('Success');
                /*var res = response.getReturnValue();
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": res,
                    "slideDevName": "detail"
                });
                navEvt.fire();
                */
            }

        });
        $A.enqueueAction(action);
    },
})