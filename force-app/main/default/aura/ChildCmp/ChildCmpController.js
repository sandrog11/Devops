({
	fireComponentEvent : function(component, event, helper) {
		var componentEvent = component.getEvent("cmpEvent");
        var msgString = component.get("v.messageString");
        if (!msgString)
        {
            msgString = 'No number';
        }
        componentEvent.setParams({
            "message" : msgString,
        });
            componentEvent.fire();
	}
})