({
    getContact : function(component, event, helper)
    {
        var recordId = event.getParam("recordId");
        let action = component.get("c.getContactDetail");
        action.setParams({
            recordId : recordId
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.contactdetails", response.getReturnValue());
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    }
})