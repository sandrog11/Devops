import { LightningElement } from 'lwc';
import retrieveCaseByCaseNumber from '@salesforce/apex/caseManager.retrieveCaseByCaseNumber';
import closeCase from '@salesforce/apex/caseManager.closeCase'
export default class CaseManager extends LightningElement {

    searchCaseNumber;
    cases; //different case from mathod retrieveCaseByCaseNumber
    errorDetails; //error message details
    caseCloseMessage; //messaggio di success or not method apex closeCase return 
    showCaseComment; //booleano che mi fa comparire il child component
    caseNumberChange(event){
        this.showCaseComment = false; //appena si apre la pagina il component child non sarà visibile
        this.searchCaseNumber = event.target.value;
        //invoke method apex imperativerly -> same name of method apex retrieveCaseByCaseNumber from caseManager class with parameter
        retrieveCaseByCaseNumber({caseNumber: this.searchCaseNumber})
        .then(result=>{
            this.cases = result;
        })
        .catch(error=>{
            this.errorDetails = error;
        });
    }

    passCaseToClose(event)
    {
        this.caseId = event.target.name; //prendo l'id dal case dal lightning button value
        closeCase({caseId: this.caseId})
        .then(result=>{
            //risultato del metodo => message success or not
            this.caseCloseMessage = result;
        })
        .catch(error=>{
            this.errorDetails = error;
        });
    }
    //Solo quando clicco il bottone 'Add Comment' si apre il child component
    newCommentAdd(event){
        //this.showCaseComment = true;
        this.caseId = event.target.name; // sul lightning button il nome equivale al caseId
        //1) Find child component in parent component ===> 
            //this.tenmplate.querySelector('nome-del-component')
        //2) Accedo al metodo del child component nel parent component
            //.metodoChildComponent(parameter)

        //accedo al cmp child caseCommentComp e chiamo il metodo setCaseRecordId(cid) presente nel js del child
                //let caseCommentComp = this.template.querySelector('c-case-comment-manager');
                this.template.querySelector('c-case-comment-manager').setCaseRecordId(this.caseId);
                
        /*setTimeout(()=> {
            this.template.querySelector('c-case-comment-manager').setCaseRecordId(this.caseId);
        }, 2000);*/
    }

}