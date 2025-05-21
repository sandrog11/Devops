({
	doInit : function(component, event, helper) {
        let action = component.get("c.getPagella");
        
        action.setParams({
            pagellaid : component.get("v.recordId")
        })
        
        action.setCallback(this, function(response){
            component.set("v.pagella", response.getReturnValue());
        });
       
        $A.enqueueAction(action);
	}
})