({
	doInit : function(component, event, helper) {
		let action = component.get("c.getDataEventoDetails");
        action.setParams({
            recordId : component.get("{!v.eventoId}")
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if ((response.getReturnValue()) == '')
            {
                alert('L\' evento selezionato non è associato a nessuna data');
            }
            
            else if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listdataevento", response.getReturnValue());
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	}
})