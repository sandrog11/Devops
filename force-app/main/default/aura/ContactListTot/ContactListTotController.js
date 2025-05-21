({
	doInit : function(component, event, helper) {
		let action = component.get("c.getListContacts");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listContacts", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	},
    showFiltered : function (component, event, helper)
    {
        var searchKey = event.getParam("searchKey");
        let action = component.get("c.getListFiltered");
        action.setParams({
            nome : searchKey
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listContacts", response.getReturnValue());
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    },
    showDetails : function(component, event, helper)
    {
        let bottone = event.getSource();
        component.set("v.contactId", bottone.get("v.value"));
        var appEvent = $A.get("e.c:ContactEvent");
        appEvent.setParams({
            "recordId" : component.get("v.contactId")
        });
        appEvent.fire();
    }
    
})