({
	createClient : function(component, newClient) {
		//istanzio l'action per chiamare il metodo apex
		let action = component.get("c.insertClient");
		
        //setto eventuali parametri da passare il metodo insertStudente apex
        action.setParams({
            contact : newClient
        });
        //callback async
        action.setCallback(this, function(response){
            var state = action.getState();
        	if (component.isValid() && state=="SUCCESS")
        {
            component.set("v.recordid", response.getReturnValue());
            alert('Cliente creato correttamente');
        }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        $A.enqueueAction(action);
	}
})