({
	doInit : function(component, event, helper) {
		let action = component.get("c.getdetailsClient");
        action.setParams({
            recordId : component.get("{!v.clientId}")
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.contactdetails", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	}
})