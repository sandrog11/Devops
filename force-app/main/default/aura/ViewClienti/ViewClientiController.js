({
	doInit : function(component, event, helper) {
		//1-> getMetodo 
		let action = component.get("c.getClientList");
        action.setParams({
            recordId : $A.get("$SObjectType.CurrentUser.Id")
        });
        //call async
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listclient", response.getReturnValue());
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
        component.set("v.clientId", bottone.get("v.value"));
        //console.log(component.get("v.positionId"));
        component.set("v.showdetail", true);
    },
    goback: function(component, event, helper){
    let bottone = event.getSource();
    component.set("v.showdetail", false);
    }
})