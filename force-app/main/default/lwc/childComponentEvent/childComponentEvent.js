import { LightningElement } from 'lwc';

export default class ChildComponentEvent extends LightningElement {
    handleChange(event){
        const message = event.target.value;

        //STEP 1: create an event
        const custEvt = new CustomEvent('mycustomevent', {detail:message});

        //SPEP 2: dispatch event
        this.dispatchEvent(custEvt);

        //STEP 3: handle event in parent component
        
    }
}