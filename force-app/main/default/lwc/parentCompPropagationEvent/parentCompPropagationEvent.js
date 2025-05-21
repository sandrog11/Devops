import { LightningElement } from 'lwc';

export default class ParentCompPropagationEvent extends LightningElement {
    message;
    constructor(){
        super();
        this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
    }
    handleCustomEvent(event){
        const childmsg = event.detail;
        this.message = childmsg;
    }
}