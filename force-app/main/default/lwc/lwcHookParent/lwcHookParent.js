import { LightningElement } from 'lwc';

export default class LwcHookParent extends LightningElement {

    constructor(){
        super();
        console.log("parent constructor hook is called");
    }

    connectedCallback(){
        console.log("Parent connectedCallback is called");
    }

    renderedCallback(){
        console.log("Parent renderedCallback is called");
    }
}