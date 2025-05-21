({
	doInit : function(component, event, helper) {
		//1-> getMetodo 
		let action = component.get("c.getdetailsPos");
        action.setParams({
            recordId : component.get("{!v.positionId}")
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.positiondetails", response.getReturnValue());
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