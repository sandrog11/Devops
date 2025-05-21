({
	handleComponentEvent : function(component, event, helper) {
		
        var message = event.getParam("message");
        component.set("v.MsgFromNotifier", message);
        var count = parseInt(component.get("v.eventCount"))+1;
        component.set("v.eventCount", count);
	}
})