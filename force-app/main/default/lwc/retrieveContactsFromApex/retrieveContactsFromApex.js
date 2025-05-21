import { LightningElement } from 'lwc';
import getAllAccounts from '@salesforce/apex/getContactsManager.getAllAccounts';
import getContactsByAccount from '@salesforce/apex/getContactsManager.getContactsByAccount';
export default class RetrieveContactsFromApex extends LightningElement {
    error;
    selectedAccount; //valore selezionato dalla combo box dell'Account
    accountOptions = []; //valori possibili nella combo box
    contacts; // => list of contacts from account


    connectedCallback(){
        getAllAccounts()
            .then(result=>{
                // FOR GENERALIZZATO => work
                for(let account of result)
                {
                    //scorro gli account trovati mediante il metodo apex getAllAccounts, e inserisco i valori all'interno della combobox
                    this.accountOptions = [...this.accountOptions,
                        {value: account.Id,
                        label: account.Name
                        }
                    ]
                }
                //FOR INDICIZZATO => work
                /*for(let i=0; i<result.length;i++)
                {
                //aggiungi elemento alla combobox
                    this.accountOptions = [...this.accountOptions,
                        {value: result[i].Id,
                            label: result[i].Name
                        }
                    ]
                }*/
                
            })
            .catch(error =>{
                this.error = error;
            });
    }

    handleChange(event){
        this.selectedAccount = event.detail.value; //aggiorna il valore selezionato
        getContactsByAccount({accountId: this.selectedAccount})
        .then(result=>{
            this.contacts = result;
        })
        .catch(error=>{
            this.error = error;
        });
    }
}