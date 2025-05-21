({
	fireEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:searchKey_appEvent");
		var searchKey = component.get("v.keysearch");
        
        if (!searchKey){
            console.log("searchKey input vuota");
        }
        appEvent.setParams({
            "searchKey" : searchKey
        });
        
        appEvent.fire();
    }
})