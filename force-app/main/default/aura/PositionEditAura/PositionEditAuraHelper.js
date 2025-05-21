({
    createPosition : function(component, position){
        /*let newPosition = component.get("v.Position");
        
        component.set("v.Position", newPosition);*/
         //istanzio l'action per chiamare il metodo apex
		let action = component.get("c.insertPosition");
        //setto eventuali parametri da passare la metodo getPosition apex
        action.setParams({
            position : position
        });
        //callback async
        action.setCallback(this, function(response){
            var state = action.getState();
            if (component.isValid() && state=="SUCCESS")
            {
                component.set("v.insertPosition", response.getReturnValue());
                alert('RecordID ' +response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        $A.enqueueAction(action);
    }
})