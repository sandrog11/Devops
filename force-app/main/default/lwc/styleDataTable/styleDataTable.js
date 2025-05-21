import { LightningElement, wire } from 'lwc';
import getAccounts  from '@salesforce/apex/styleDataTableController.getAccounts';
const COLUMNS  = [
    {label: 'Account Name', fieldName:'Name'
    },
    {label: 'AnnualRevenue', fieldName:'AnnualRevenue', type:'currency',
        cellAttributes:{
            class:{fieldName: 'amountColor'},
            iconName: {fieldName:'iconName'}, iconPosition:'right'
        }
    },
    {label: 'Industry', fieldName:'Industry',
        cellAttributes:{
            class:{fieldName:'industryColor'}
        }
    },
    {label: 'Phone', fieldName:'Phone', type:'phone'},
];
export default class StyleDataTable extends LightningElement {
    tableData;
    tableColumn = COLUMNS;
    @wire(getAccounts)
    accountHandler({data, error}){
        if (data){
            //this.tableData = data;
            this.tableData = data.map(item =>{
                let amountColor = item.AnnualRevenue < 5000 ? "slds-text-color_error" : "slds-text-color_success";
                let iconName = item.AnnualRevenue < 5000 ? "utility:down" : "utility:up"; 
                return {...item,
                    "amountColor": amountColor,
                    "iconName": iconName,
                    //iconCustom25 => color rows => Industries
                    "industryColor": "slds-icon-custom-custom20"
                }
            })
        }
        else if (error){
            console.log(error);
        }
        
    }
}