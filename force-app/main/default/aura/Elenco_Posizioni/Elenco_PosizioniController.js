({
    doInit : function(component, event, helper) {
        let action = component.get("c.getListPos");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listPositions", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    },
    handleComponentEvent : function (component, event, helper) {
        var area = event.getParam("area");
        var tipo = event.getParam("tipo");
        var flag = event.getParam("flag");
        if (flag == true)
        {
            var a = component.get('c.doInit');
            $A.enqueueAction(a);
        }
        if (area == '' && tipo =='')
        {
            alert('Seleziona almeno un filtro');
            //rimani tutte le posizioni sulla pagina
            var a = component.get('c.doInit');
            $A.enqueueAction(a);
        }
        let action = component.get("c.getListPosFiltro");
        action.setParams({
            area : area,
            tipo : tipo
        });
        //call async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state == "SUCCESS")
            {
                component.set("v.listPositions", response.getReturnValue())
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    },
    showCandidates : function (component, event, helper)
    {
        let bottone = event.getSource();
        component.set("v.positionId", bottone.get("v.value"));
        var appEvent = $A.get("e.c:Evento_Position");
        appEvent.setParams({
            "positionId" : component.get("v.positionId"),
            "flag" : true
        });
        appEvent.fire();
    },
    showWebSites : function (component, event, helper)
    {
        let bottone = event.getSource();
        component.set("v.positionId", bottone.get("v.value"));
        var appEvent = $A.get("e.c:Evento_Position");
        appEvent.setParams({
            "positionId" : component.get("v.positionId"),
            "flag" : false
        });
        appEvent.fire();
    }
})