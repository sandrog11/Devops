({
	submit : function(component, event, helper) {
        //get data, colori and checkbox
		let data = component.find("dataid");
        let check = component.find("checkid");
        let color = component.find("selectid");
        
        let datavalue = data.get("v.value");
        let checkvalue = check.get("v.checked");
        let colorvalue = color.get("v.value");
        
        
        //se data è vuota-> alert
        if (datavalue == "" || checkvalue == false || colorvalue== "")
        {
            alert('Devi compilare il form');
        }
        else
            alert('Fatto');
        
	},
    changecheched: function(component, event, helper){
        let check = component.find("checkid");
        let checkvalue = check.get("v.checked");
        
        if (checkvalue == true)
        {
            alert('Hai selezionato la casella');
        }
        else
            alert('Casella non selezionata');
    },
    message : function (component, event, helper){
        let bottone = event.getSource();
        let buttonLabel = bottone.get('v.label');
        
        if (buttonLabel == 'Open Message')
        {
            bottone.set('v.label', 'Close Message');
        	var attributeValue = component.get("v.message");
        	component.set("v.message", 'Buongiorno');
        }
        if (buttonLabel == 'Close Message')
        {
            bottone.set('v.label', 'Open Message');
            component.set("v.message", '');
        }
            
    }
})