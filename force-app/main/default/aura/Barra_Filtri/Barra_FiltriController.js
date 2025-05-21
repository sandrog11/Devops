({
    fireComponentEvent : function(component, event, helper) {
        var componentEvent = component.getEvent("cmpEvent");
        componentEvent.setParams({
            "area" : component.find("select").get("v.value"),
            "tipo" : component.find("select1").get("v.value"),
        });
        componentEvent.fire();
    },
    fireComponentReset : function (component, event, helper){
        var componentEvent = component.getEvent("cmpEvent");
        componentEvent.setParams({
            "area" : component.find("select").set("v.value", ""),
            "tipo" : component.find("select1").set("v.value", ""),
            "flag" : true
        });
        
        componentEvent.fire();
        
    }
})