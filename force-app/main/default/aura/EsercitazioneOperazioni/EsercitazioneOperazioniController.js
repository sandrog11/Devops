({
	sum : function(component, event, helper) {
        //prendo il primo operatore e il secondo operatore
		let firstop = component.find("firstinput");
        let secondtop = component.find("secondinput");
        
        //accedo al valore della prima e della seconda casella di input
        let firstvalue = firstop.get("v.value");
        let secondvalue = secondtop.get("v.value");
        
        if (firstvalue == "" || secondvalue == "")
        {
            alert('Inserisci operatore');
        }
        else
        {
            let ris = parseInt(firstvalue) + parseInt(secondvalue);
            component.set("v.result", "Il risultato della somma è "+ ris);
        }
            
	},
    sumchange : function (component, event, helper){
        //prendo il primo operatore e il secondo operatore
		let firstop = component.find("thirdinput");
        let secondtop = component.find("pokerinput");
        
        //accedo al valore della prima e della seconda casella di input
        let firstvalue = firstop.get("v.value");
        let secondvalue = secondtop.get("v.value");
        
        if (firstvalue != "" && secondvalue != "")
        {
            let ris = parseInt(firstvalue) + parseInt(secondvalue);
            component.set("v.result1", "Il risultato della somma è "+ ris);
        }
    }
})