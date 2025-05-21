({
	handleClick : function(component, event, helper) {
        var whichOne = event.getSource().get("v.label");
		//change label button
		event.getSource().set("v.label", 'Clicked');
	}
})