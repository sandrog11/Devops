({
	viewDetailsContact : function(component, event, helper) {
		let action = component.get("c.getContact");
        var recordId = event.getParam("recordId");
        //setto eventuali parametri se il metodo apex li ha
        action.setParams({
        	recordId : recordId
    	});
        
        //callback async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.detailsContact", response.getReturnValue())
                response.getReturnValue();
            }
            else {
                console.error("Error retrieving contact list");
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    }
})