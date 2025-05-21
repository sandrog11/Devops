({
    //METODO GET
	/*doInit : function(component, event, helper) {
		//istanzio l'action per chiamare il metodo apex
		let action = component.get("c.insertPosition");
        
        //setto eventuali parametri da passare la metodo getPosition apex
        action.setParams({
            position : component.set("{!v.Position}")
        });
        //callback async
        action.setCallback(this, function (response){
        var state = response.getState();
        if (component.isValid() && state=="SUCCESS")
        {
            //imposto l'attributo di tipo Position
            //con l'oggetto tornato da apex
            component.set("v.Position", response.getReturnValue());
        }
            else{
                console.log("Failed with state: "+ state);
            }
    });
        //chiamo il metodo apex
        $A.enqueueAction(action);
        
	},*/
    handleclick: function(component, event, helper){
        let datainizio = component.get("v.Position.Open_Date__c");
        let datafine = component.get("v.Position.Close_Date__c");
        let minpay = component.get("v.Position.Min_Pay__c");
        let maxpay = component.get("v.Position.Max_Pay__c");
        let validPosition = component.find('positionform').reduce(function (validSoFar, inputCmp){
            //Display error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (validPosition)
        {
            if (datainizio > datafine)
            {
               	alert('Data inizio superiore a data fine!');
            }
            else if (minpay > maxpay)
            {
                alert('La paga minore è maggiore della maxpay!');
            }
            else
            {
               let newPosition = component.get("v.Position");
                helper.createPosition(component, newPosition);
            }
                
        }
        
    }
})