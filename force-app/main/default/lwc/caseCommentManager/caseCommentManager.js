import { LightningElement, api } from 'lwc';
import addCaseComment from '@salesforce/apex/caseCommentManager.addCaseComment';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CaseCommentComp extends LightningElement {

    @api caseRecordId;
    caseCommentBody;

    @api
    setCaseRecordId(caseIdInput){
        this.caseRecordId = caseIdInput;
    }

    handleChange(event){
        if(event.target.name == 'caseCmnt')
        {
            this.caseCommentBody = event.target.value;
        }
    }
    createCaseComment(event){

        //call method apex
        addCaseComment({caseId:this.caseRecordId, cBody:this.caseCommentBody})
        .then(result=>{
            console.log(this.caseRecordId);
            const evt = new ShowToastEvent({
                title: 'success',
                message: 'Case Comment added',
                variant: 'success'
            });
            this.dispatchEvent(evt);
        })
        .error(error=>{
            console.log(error);
            const evt = new ShowToastEvent({
                title: 'error',
                message: 'Some exception added',
                variant: 'error'
            });
            this.dispatchEvent(evt);
        })
    }
}