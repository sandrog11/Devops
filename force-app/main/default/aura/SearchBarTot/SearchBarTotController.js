({
	fireComponentEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:ComponentEventContact");
        var nameContact = component.get("v.nameContact");
        appEvent.setParams({
            "searchKey" : nameContact
        });
        appEvent.fire();
	}
    
})