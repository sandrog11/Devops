({
	viewform : function(component, event, helper) {
		let bottone = event.getSource();
        let bottonLabel = bottone.get('v.label');
        
        if (bottonLabel == 'New')
        {
            bottone.set('v.label', 'Indietro');
        	component.set("v.checkbool", true);
        }
        if (bottonLabel == 'Indietro')
        {
            bottone.set('v.label', 'New');
        	component.set("v.checkbool", false);
        }
	}
})