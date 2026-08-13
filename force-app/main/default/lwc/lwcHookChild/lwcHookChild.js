import { LightningElement } from 'lwc';

export default class LwcHookChild extends LightningElement {
    constructor(){
        super();
        console.log("Child constructor hook is called");
    }

    connectedCallback(){
        console.log("Child connectedCallback is called");
    }

    renderedCallback(){
        console.log("Child renderedCallback is called");
    }
}