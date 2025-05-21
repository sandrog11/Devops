import { LightningElement } from 'lwc';

export default class ChildCompPropagationEvent extends LightningElement {
    handleChange(event){
        const message = event.target.value;

        //STEP 1: create an event
        const custEvt = new CustomEvent('mycustomevent',
            {detail:message, bubbles:true});

        //SPEP 2: dispatch event
        this.dispatchEvent(custEvt);
        
    }
}