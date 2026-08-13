import { LightningElement } from 'lwc';
import searchAccountsByName from '@salesforce/apex/AccountController.searchAccountsByName';

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Account Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' }
];

export default class P2cPrimitiveParent extends LightningElement {
    student ='Subramani Kumarasamy';
    title= 'Happy human';

    info ={
        name: 'Subramani',
        city: 'Espoo',
        country: 'Finland'
    };
    
    columns = COLUMNS;
    searchKey;
    data;
    name;
    
    searchHandler(event){
        this.searchKey = event.target.value;
        searchAccountsByName( { searchKeyword : this.searchKey } )
            .then( result => {
                this.data = result;
            })
            .catch( error => {
                console.log('Here is the error '+error);
            })
    }

    changeHandler(event){
        this.name= event.target.value;
    }
    addContactToChild(event){
        console.log('Contact Info '+this.name);
       const childElem= this.template.querySelector('c-p2c-primitive-child');
       childElem.addContact(this.name);
    }
}