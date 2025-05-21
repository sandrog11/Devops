import { LightningElement, track, wire } from 'lwc';
import { publish, MessageContext} from 'lightning/messageService';
import SampleMessageChannel from '@salesforce/messageChannel/SampleMessageChannel__c';

export default class MyMessagePublisher extends LightningElement {
    @track messages = [];
    @wire(MessageContext)
    messageContext;
    sendHandler(){
        const inputElement = this.template.querySelector('lightning-input');

        console.log('query selector => '+inputElement);

        if (inputElement)
             {
                const inputmessage = inputElement.value;
                this.messages.push(
                    {
                    id: this.messages.length,
                    value: inputmessage,
                    from: 'LWC'
                    }
                );
                //for comment: Shift+Alt+A
                    const messagePayload = {
                    message: inputmessage,
                    from: 'LWC'
                 };
                 publish(this.messageContext, SampleMessageChannel,messagePayload);
                 inputElement.value= "";
             }
    }
}