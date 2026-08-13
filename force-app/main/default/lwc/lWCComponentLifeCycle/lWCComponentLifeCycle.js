import { LightningElement } from 'lwc';

export default class LwchookParent extends LightningElement {

    // 1st
    constructor(){
        super();
        console.log('Parent constructor hook is called');
    }
    // 2nd
    connectedCallback(){
        console.log('Parent connectedCallback hook is called');

    }
    //3rd
    // render(){
    //     console.log('render hook is called');
    // }
    //4th
    renderedCallback(){
        console.log('Parent renderCallback hook is called');
    }
    // 5th
    disconnectedCallback(){
        console.log('Parent disconnectedCallback hook is called');
    }
    //6th
    errorCallback(){
        console.log('Parent errorCallback hook is called');
    }
    // After mounting, but before unmounting phase
    input;
    changeHandler(event){
        console.log('Parent normal action method is called');
        this.input = event.target.value;
    }

    showChild = true;
    clickHandler(event){
        if(this.showChild){
            this.showChild = false;
        }
        else{
            this.showChild=true
        }
    }
}