import { LightningElement } from 'lwc';

export default class BasicCalculator extends LightningElement {
    firstInput;
    secondInput;
    totalValue;
    showResult = false;

    //function to onchange first lightning input number
    firstInputChange(event){
        // next row: sto associando alla variabile firstInput il valore del lightning input appena verrà popolato e quindi partirà l'onchange()
        this.firstInput = event.target.value;
    }
    secondInputChange(event){
        // next row: sto associando alla variabile secondInput il valore del lightning input appena verrà popolato e quindi partirà l'onchange()
        this.secondInput = event.target.value;
    }
    sum(event){
        //faccio la somma ma con il cast a number per ogni variable
        if (this.firstInput != null && this.secondInput != null && this.firstInput != "" && this.secondInput != "")
        {
            this.totalValue = 'Il risultato della somma è: '+ (Number(this.firstInput) + Number(this.secondInput));
            this.showResult = true;
        }
        else
        this.totalValue = 'Popola entrambi i campi input';
        this.showResult = true;
    }
    subtract(event){
        if (this.firstInput != null && this.secondInput != null && this.firstInput != "" && this.secondInput != "")
        {
            //faccio la differenza ma con il cast a number per ogni variable
            this.totalValue = 'Il risultato della sottrazione è: '+ (Number(this.firstInput) - Number(this.secondInput));
            this.showResult = true;
        }
        else
        this.totalValue = 'Popola entrambi i campi input';
        this.showResult = true;
    }
    moltiplication(event){
        if (this.firstInput != null && this.secondInput != null && this.firstInput != "" && this.secondInput != "")
        {
            //faccio la moltiplicazione ma con il cast a number per ogni variable
            this.totalValue = 'Il risultato della moltiplicazione è: '+ (Number(this.firstInput) * Number(this.secondInput));
            this.showResult = true;
        }
        else
        this.totalValue = 'Popola entrambi i campi input';
        this.showResult = true;
    }
    division(event){
        if (this.firstInput != null && this.secondInput != null && this.firstInput != "" && this.secondInput != "")
        {
            //faccio la divisione ma con il cast a number per ogni variable
            this.totalValue = 'Il risultato della divisione è: '+ (Number(this.firstInput) / Number(this.secondInput));
            this.showResult = true;
        }
        else
        this.totalValue = 'Popola entrambi i campi input';
        this.showResult = true;
    }
}