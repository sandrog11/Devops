({
    handleComponentEvent : function(component, event, helper) {
        var candidateId = event.getParam("candidateId");
        component.set("v.checkdetail", true);
        let action = component.get("c.getCandidate");
        action.setParams({
            candidateId : candidateId
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == 'SUCCESS')
            {
                component.set("v.candidatedetails", response.getReturnValue())
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    }
})