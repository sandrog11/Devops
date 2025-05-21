import { LightningElement, api } from 'lwc';

export default class LifeCycleHookExampleLWC extends LightningElement {
    @api message = 'Welcome ';
    constructor() {
        super();
        console.log('Executing Constructor');
        this.message = this.message + 'to the LWC';
    }
    connectedCallback(){
        console.log('Executing connected callback');
    }
    disconnectedCallback(){
        console.log('Executing disconnected callback');
    }
    renderedCallback(){
        console.log('Executing rendered callback');
    }
    /*errorCallback(error, stack){
        this.error = error;
    }*/
}