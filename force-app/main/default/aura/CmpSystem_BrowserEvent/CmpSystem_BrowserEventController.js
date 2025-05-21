({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccountsList");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.accList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    
    handleChange : function(component, event, helper) {
        console.log(component.find("select").get("v.value"));
    component.set("v.recordId", component.find("select").get("v.value"));
    }
    
})