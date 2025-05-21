({
	handleClick : function(component, event, helper) {
		let bottone = event.getSource();
        //let buttonLabel = bottone.get('v.label');
        //console.log(buttonLabel);
        //bottone.set('v.label', 'Name changed');
		var attributeValue = component.get("v.text");
        component.set("v.text", bottone.get("v.label"));
    },
    startGame : function(component, event, helper){
    //accedo al combobox tag tramite 'find' e riferimento all'id dato al tag
    let gameModeComboBox = component.find("gameMode");
    
    //accedo al valore del tag che mi sono recuperata, tramite get e v.value
    let selectedValue = gameModeComboBox.get("v.value");
    
    //aggiorno l'attributo selectedMode con il valore selezionato
    component.set("v.selectedMode", selectedValue);
    },
    confirm:function (component, event, helper){
        //questa funzione parte su onchange
       	let gameModeComboBox = component.find("gameMode");
        
        //accedo ai valori di combobox
        let selectedValue = gameModeComboBox.get("v.value");
        alert ('Hai scelto il livello '+ selectedValue);
    }
    })