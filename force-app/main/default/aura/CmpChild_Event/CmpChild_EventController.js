({
	fireComponentEvent : function(component, event, helper) {
		var cmpEvent = component.getEvent("cmpEvent");
        // Ottieni l'elemento del bottone cliccato
        var button = event.getSource();
        //console.log(button.get("v.label"));
        var msgString = button.get("v.label");
        
        msgString = $A.util.isEmpty(msgString) ? "No Message Passed" : msgString;
        
        cmpEvent.setParams({
            //"message": msgString
            "message": msgString
        });
        
        cmpEvent.fire();
	}
})