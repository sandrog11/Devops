({
    changevalue : function(component, event, helper) {
        let button = component.find('saveid');
        let nomeid = component.find("nome");
        let nomevalue = nomeid.get("v.value");
        
        let numeroid = component.find("numero");
        let numerovalue = numeroid.get("v.value");
        
        let sitoid = component.find("site");
        let sitovalue = sitoid.get("v.value");
        
        let phoneid = component.find("phone");
        let phonevalue = phoneid.get("v.value");
        
        let faxid = component.find("fax");
        let faxvalue = faxid.get("v.value");
        
        let websiteid = component.find("website");
        let websitevalue = websiteid.get("v.value");
        
        if (nomevalue!="" && numerovalue!="" && sitovalue!="" && phonevalue!="" && faxvalue!="" && websitevalue!="")
        {
            
            button.set('v.disabled',false);
        }
        else
            button.set('v.disabled',true);
    },
    salva : function(component, event, helper){
        alert('Fatto');
    }
})