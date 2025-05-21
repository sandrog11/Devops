import { LightningElement, api } from 'lwc';

export default class GenericPagination extends LightningElement {
    currentPage = 1;
    totalPage = 0;
    //numero totale di records
    totalRecord;
    //numero di records visibili per ogni pagina
    visibleRecords;
    @api recordsize = 3;

    get previousDisabled(){
        return this.currentPage <= 1;
    }

    get nextDisabled(){
        return this.currentPage >= this.totalPage;
    }
    //decremento current page e passo alla pagina precedente
    previousHandler(event){
        if (this.currentPage > 1 )
        {
            this.currentPage --;
        }
        this.updateRecords();
    }
    //incremento current page e passo alla pagina successiva
    nextHandler(event){
        if (this.currentPage < this.totalPage)
            {
                this.currentPage ++;
            }
            this.updateRecords();
    }
    updateRecords()
    {
        const start = (this.currentPage -1 ) * this.recordsize;
        const end = this.recordsize * this.currentPage;
        this.visibleRecords = this.totalRecord.slice(start, end);
        this.dispatchEvent(new CustomEvent('pagination', {
            detail:{
                records:this.visibleRecords
            }
        }))
    }
}