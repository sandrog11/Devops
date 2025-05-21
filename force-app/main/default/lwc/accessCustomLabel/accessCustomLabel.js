import { LightningElement } from 'lwc';
//import custom label --> import LabelName from @salesforce/label/labelReference
import WelcomeMessage from '@salesforce/label/c.WelcomeMessage';
import Declaration from '@salesforce/label/c.Declaration';
import Desclaimer from '@salesforce/label/c.Desclaimer';
export default class AccessCustomLabel extends LightningElement {
    label = {
        WelcomeMessage,
        Declaration,
        Desclaimer
    }
}