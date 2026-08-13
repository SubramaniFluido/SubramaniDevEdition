import { LightningElement } from 'lwc';

export default class CustomEventLWCChild extends LightningElement {
    handleSubtract(event){
        // Create a Custom Event of name as 'add'
        const subtractEvent = new CustomEvent('subtraction');
        // Dispatch Custom Event
        this.dispatchEvent(subtractEvent);
    }

    handleAdd(event){
        // Create a Custom Event of name as 'add'
        const addEvent = new CustomEvent('addition');
        // Dispatch Custom Event
        this.dispatchEvent(addEvent);
    }

    progress;

    handleChange(event){
        this.progress=event.target.value;
    }  
    
    handleClick(event){
        const progressEvent= new CustomEvent('progressbar', { detail: this.progress })
        this.dispatchEvent(progressEvent);
    }
    
}