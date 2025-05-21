({
	doInit : function(component, event, helper) {
        //1-> getMetodo 
		let action = component.get("c.getPosList");
        /*action.setParams({

        });*/
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.positionList", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	},
    showDetails : function (component, event, helper){
        let bottone = event.getSource();
        component.set("v.positionId", bottone.get("v.value"));
        //console.log(component.get("v.positionId"));
        component.set("v.showdetail", true);
    },
    goback: function(component, event, helper){
    let bottone = event.getSource();
    component.set("v.showdetail", false);
	}
})