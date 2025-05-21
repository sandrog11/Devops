import { LightningElement } from 'lwc';

export default class CourseFee extends LightningElement {
    courseName = 'Salesforce Lightning Web Component';
    courseFee = '200';
    numberOfStudents = '20';
    totalFee = '200';
    changeFee(event){
        this.courseFee = event.target.value;
    }
    changeNumberOfStudents(event){
        this.numberOfStudents = event.target.value;
    }
    calculateTotalFee(){
        this.totalFee = parseFloat(this.courseFee) * parseFloat(this.numberOfStudents);
    }
    
}