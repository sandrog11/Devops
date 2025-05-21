({
    handleComponentEvent : function(component, event, helper) {
        component.set("v.showvuoto", true);
        var positionId = event.getParam("positionId");
        var flag = event.getParam("flag");
        let action = component.get("c.getWebsitesForPosition");
        if (flag == false)
        {
            component.set("v.showdetail", false)
            
            action.setParams({
                positionId : positionId
            });
            //call async
            action.setCallback(this, function(response){
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS")
                {
                    component.set("v.listWebSites", response.getReturnValue())
                }
                if (response.getReturnValue() == '')
                {
                    component.set("v.stringa", "Questa posizione non risulta ancora pubblicata da alcun sito");
                    
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
        $A.enqueueAction(action);
        
    },
    showDetails : function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        component.set("v.isOpen", true);
        let bottone = event.getSource();
        component.set("v.websiteId", bottone.get("v.value"));
        let action = component.get("c.getWebsites");
        action.setParams({
                websiteId : component.get("v.websiteId")
            });
        //call async
            action.setCallback(this, function(response){
                var state = response.getState();
                if (component.isValid() && state == "SUCCESS")
                {
                    component.set("v.webSite", response.getReturnValue())
                }
            });
        //chiamo il metodo apex
        $A.enqueueAction(action);
    },
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "False"  
        component.set("v.isOpen", false);
    },
    
    likenClose: function(component, event, helper) {
        // Display alert message on the click on the "Like and Close" button from Model Footer 
        // and set set the "isOpen" attribute to "False for close the model Box.
        alert('thanks for like Us :)');
        component.set("v.isOpen", false);
    }
})