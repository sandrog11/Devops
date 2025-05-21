({
	handleclick : function(component, event, helper) {
		let validClient = component.find('clientform').reduce(function (validSoFar, inputCmp){
            //Display error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            console.log(inputCmp);
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (validClient)
        {      
            let newClient= component.get("v.Contact");
            helper.createClient(component, newClient);
        }
        
	}
})