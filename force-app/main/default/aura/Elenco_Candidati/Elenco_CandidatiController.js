({
    handleComponentEvent : function(component, event, helper) {
        component.set("v.showvuoto", true);
        var positionId = event.getParam("positionId");
        var flag = event.getParam("flag");
        let action = component.get("c.getCandidatesForPositions");
        if (flag == true)
        {
            component.set("v.showdetail", false);
        action.setParams({
            positionId : positionId
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listCandidates", response.getReturnValue())
            }
            if (component.get("v.listCandidates") == '')
            {
                component.set("v.stringa", "Non ci sono candidati per la posizione selezionata" );
                
                //mettere la label del bottone -> 'Non ci sono candidati per la posizione selezionata'
                /*.set('v.label', 'Non ci sono candidati per la posizione selezionata');*/
            }
            else{component.set("v.stringa","")}
        });
            
        }
        
        else
        {
            component.set("v.showvuoto", false);
            component.set("v.showdetail", true);
        }
        //chiamo il metodo apex
        
        console.log('show vuoto '+ component.get("v.showvuoto"));
        console.log('show detail '+ component.get("v.showdetail"));
        $A.enqueueAction(action);
    },
    showDetails : function(component, event, helper) {
        let bottone = event.getSource();
        component.set("v.candidateId", bottone.get("v.value"));
        
        var componentEvent = component.getEvent("cmpEventC");
        componentEvent.setParams({
            "candidateId" : component.get("v.candidateId")
        });
        componentEvent.fire();
    }
})