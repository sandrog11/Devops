import { LightningElement, track, wire } from 'lwc';
import fetchAccountsDetails from '@salesforce/apex/AccountWrapperLWC.fetchAccountsDetails';

export default class AccountDetailsWrapper extends LightningElement {
    @track columns = [
        { label: 'Account Name', fieldName: 'accName' },
        { label: 'Type', fieldName: 'accType' },
        { label: 'Number of Cases', fieldName: 'totalCases' },
        { label: 'Number of Contacts', fieldName: 'totalContacts'},
        { label: 'Number of Opportunities', fieldName: 'totalOpportunities'}
    ];
    @track accWrapperList;
    @track error;
    @wire (fetchAccountsDetails)
    wiredAccountsDetailsWrapper({data,error})
    {
        if (data)
        {
            console.log(data);
            this.accWrapperList = data;
        }
        else if (error)
        {
            console.log('error retrieve accounts');
            this.error = error;
        }
    }
}