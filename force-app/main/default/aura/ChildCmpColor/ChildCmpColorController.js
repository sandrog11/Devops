({
	fireComponentEvent : function(component, event, helper) {
		var componentEvent = component.getEvent("cmpEvent");
        var bottone = event.getSource();
        var buttonlabel = bottone.get('v.label');
		if (!buttonlabel)
        {
            buttonlabel = 'No selected button';
        }
        componentEvent.setParams({
            "message" : buttonlabel
        });
        componentEvent.fire();
    }
})