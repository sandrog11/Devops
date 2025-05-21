import { LightningElement } from 'lwc';

export default class ParentComponentEvent extends LightningElement {
    message;
    handleCustomEvent(event){
        //dal child component prendo dall'evento creato il contenuto di detail e lo inserisco in message
        //handle event in parent component
        const childmessage = event.detail;
        this.message = childmessage;
    }
}