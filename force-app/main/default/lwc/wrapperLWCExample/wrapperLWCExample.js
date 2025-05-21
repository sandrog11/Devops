import { LightningElement, wire, track } from 'lwc';
import getAllAccountWithContacts from '@salesforce/apex/AccountContactController.getAllAccountWithContacts';

export default class WrapperLWCExample extends LightningElement {
    @track accountsWithContacts;
    @track error;
    @wire(getAllAccountWithContacts)
    wiredAccountsWithContacts({data, error})
    {
        if (data)
        {
            this.accountsWithContacts = data;
        }
        else if (error)
        {
            console.log('error retrieve accounts with contacts');
            this.error = error;
        }

    }
}