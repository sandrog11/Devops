({
	check : function(component, event, helper) {
		var cmp = component.find("inputId");
        var value = cmp.get("v.value");
        console.log(value);
        
        //is number 
        if (isNaN(value))
        {
            //alert("non è un numero");
            cmp.set("v.errors",[{message: "Input not a number: "+ value}]);
        }
        else
        {
            //clear error => is number
            alert("E' un numero");
            cmp.set("v.errors", null);
        }
	}
})