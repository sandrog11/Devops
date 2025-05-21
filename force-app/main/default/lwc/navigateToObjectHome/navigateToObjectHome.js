import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class NavigateToObjectHome extends NavigationMixin(LightningElement) {
    //open the Account home page
    navigateToAccountHome(){    
        this[NavigationMixin.Navigate](
            {
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home'
                }
            }
        );
    }
}