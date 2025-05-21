({
    myAction : function(component, event, helper) {	
        component.set("v.Columns", [
            {label:"Fist Name", fieldName:"FirstName", type:"text"},
            {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Phone", fieldName:"Phone", type:"phone"}
        ]);
        
        var action = component.get("c.getContacts");
        
        action.setParams({
            recordId: component.get("v.recordId")
        });
        action.setCallback(this, (response) => {
            component.set("v.Contacts", response.getReturnValue());
        });
            
            $A.enqueueAction(action);
        }
        })