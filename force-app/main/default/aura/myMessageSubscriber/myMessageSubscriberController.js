({
	sendHandler : function(component, event, helper) {
        // lwc => const inputElement = this.template.querySelector('lightning-input');
        /*aura by aura:id => */ const cmpInput = component.find("inputbox");
        if (cmpInput)
        {
            const inputMessage = cmpInput.get("v.value");
            const messages = component.get("v.messages"); 
            // ==> lwc ==>  const message = inputElement.value;
            messages.push(
                    {
                    id: messages.length,
                    value: inputMessage,
                    from: 'Aura'
                    });
                    component.set("v.messages", messages);
                    //Use the JavaScript function JSON.stringify() to convert a object in a string.
                    console.log('messages => '+ JSON.stringify(messages));
        }
        
		
	},
        messageHandler : function(component, event, helper){
                if(event && event.getParam("message") && event.getParam("from") != 'AURA')
                {
                        const msg = event.getParam("message");
                        const messages = component.get("v.messages");
                        messages.push({
                                id: messages.length,
                                value: msg,
                                from: event.getParam("from")
                        });
                        component.set("v.messages", messages);
                }
        }
})