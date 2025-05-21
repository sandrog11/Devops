({
	doInit : function(component, event, helper) {
		let action = component.get("c.getContact");
        
        action.setParams({
            recordId : component.get("{!v.recordId}")
        });
        //callback async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state=="SUCCESS")
            {
                //imposto l'attributo di tipo Studente
                //con l'oggetto tornato da apex
                component.set("v.Contact", response.getReturnValue());
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