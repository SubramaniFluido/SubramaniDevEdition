import { LightningElement, api, track } from 'lwc';

export default class P2cPrimitiveChild extends LightningElement {
    @api student;
    @api title;
    @api detail;
    @api accounts;
    @api fields;
    @track contactNames = ['Subbbu', 'Adam', 'Mani'];

    @api addContact(newContactName){
        this.contactNames.push(newContactName);
    }

}