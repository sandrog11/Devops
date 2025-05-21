({
	doInit : function(component, event, helper) {
		let action = component.get("c.getListContacts");
        
        //setto eventuali parametri se il metodo apex li ha
        /*action.setParams({
        	name : component.get("{!v.name}")
    	});*/
        
        //callback async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.ContactList", response.getReturnValue())
            }
            else {
                console.error("Error retrieving contact list");
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	},
    
    showFiltered : function(component, event, helper) {
        let action = component.get("c.getListFiltered");
        var searchKey = event.getParam("searchKey");
        //setto eventuali parametri se il metodo apex li ha
        action.setParams({
        	nome : searchKey
    	});
        
        //callback async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.ContactList", response.getReturnValue())
            }
            else {
                console.error("Error retrieving contact list");
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    },
    
    fireAppEvent : function(component, event, handler){
        var appEvent = $A.get("e.c:recordId_appEvent");
		// Retrieve the value of the clicked button
        var button = event.getSource();
        var recordId = button.get("v.value");
        
        if (!recordId){
            console.log("recordId input vuota");
        }
        appEvent.setParams({
            "recordId" : recordId
        });
        
        appEvent.fire();
    }
})