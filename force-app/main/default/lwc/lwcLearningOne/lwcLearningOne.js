import { LightningElement, track, wire } from 'lwc';
import CONTACT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import apex class
import getAccountList from '@salesforce/apex/lwcClass.getAccountList';

const columns = [
    { label: 'Account Name', fieldName: 'name' },
    { label: 'Account Revenue', fieldName: 'AnnualRevenue' }
];

export default class LwcLearningOne extends LightningElement {
    textValue;
    showContent;
    @track contact={
        name: 'Subramani',
        email: 'subramani@help.com',
        title: 'Software Develoer'
    };
    user=['John', 'Blake', 'Ben'];
    fruits= ['Grape', 'Mango', 'Gauva', 'PineApple', 'Jackfruit'];
    contacts = [
        { id: 1, name: 'Subramani', title:'Salesforce Developer'}, 
        { id: 2, name: 'Ben', title:'FPA Analyst'},
        { id: 3, name: 'Thomas', title:'Revenue Specilist'},
        { id: 4, name: 'Blake', title:'Finance Developer'}
    ];
    objectApiName= CONTACT;
    fields= [NAME_FIELD, EMAIL_FIELD];
    handleDynamicInput(event) {
        console.log('I am the log' + event);
        console.log('I am the log target ' + JSON.stringify(event.target.value));
        console.log('I am the log detail' + JSON.stringify(event.detail));
        this.textValue = event.detail.value;
    }

    handleTrackInput(event) {
        this.contact.title = event.detail.value;
    }

    handleArrayInput(event) {
        this.user = ['New User'];
    }

    get firstValue(){
        return this.user[0];
    }

    handleClick(event) {
        this.showContent= true;
    }

    showSuccessMessage(){
        const event = new ShowToastEvent({
            title: 'Contact Success',
            message:
                'Contact is created successfully!',
        });
        this.dispatchEvent(event);
    }

    columns = columns;

    @wire(getAccountList)
    accounts;

    handleClick(event){

        // if you want to query only one element, here h1 is the one element.
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        elem.style.border ='2px Solid green';
        elem.style.background= 'red';

        const fruitElem = this.template.querySelectorAll('.fruit');
        fruitElem.forEach(item => {
            console.log(item.innerText);
            item.setAttribute('class', 'slds-align_absolute-center');
            item.style.background='green';
        })
    }
}