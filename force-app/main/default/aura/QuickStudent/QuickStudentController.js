({
    viewmostra:function (component, event, helper){
    let bottone = event.getSource();
        let bottonLabel = bottone.get('v.label');
        if (bottonLabel == 'Mostra i termini e le condizioni')
        {
            bottone.set('v.label', 'Chiudi i termini e le condizioni');
        	component.set("v.boolmostra", true);
        }
        else if (bottonLabel == 'Chiudi i termini e le condizioni')
        {
            bottone.set('v.label', 'Mostra i termini e le condizioni');
        	component.set("v.boolmostra", false);
        }
},
	/*doInit : function(component, event, helper) {
		let action = component.get("c.getStudente");
        
        action.setParams({
            recordId : component.get("{!v.recordId}")
        });
        //callback async
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state=="SUCCESS")
            {
                //imposto l'attributo di tipo Studente
                //con l'oggetto tornato da apex
                component.set("v.Studente", response.getReturnValue());
            }
            else
            {
                console.log("Failed with state: "+ state);
            }
        });
        //chiamo il metodo apex
        $A.enqueueAction(action);
	},*/
    handleclick:function(component, event, helper){
        let checkbox = component.get("{!v.check}");
        console.log(checkbox);
        let validStudent = component.find('studentform').reduce(function (validSoFar, inputCmp){
            //Display error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (validStudent && checkbox==true)
        {      
            let newStudente = component.get("v.Studente");
            helper.createStudent(component, newStudente);
        }
        else
        {
            if (checkbox == false)
            {
                alert("Devi accettare i termini!");
            }  
        }
    }
})