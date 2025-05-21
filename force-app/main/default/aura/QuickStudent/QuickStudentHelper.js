({
	createStudent : function(component, newStudente) {
		//istanzio l'action per chiamare il metodo apex
		let action = component.get("c.insertStudente");
		
        //setto eventuali parametri da passare il metodo insertStudente apex
        action.setParams({
            studente : newStudente
        });
        //callback async
        action.setCallback(this, function(response){
            var state = action.getState();
        	if (component.isValid() && state=="SUCCESS")
        {
            component.set("v.insertStudente", response.getReturnValue());
            alert('Studente creato correttamente');
        }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        $A.enqueueAction(action);
        
    }
})