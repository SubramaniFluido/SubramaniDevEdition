import { LightningElement } from 'lwc';

export default class CustomEventLWCParent extends LightningElement {
    count =0;
    progressValue;

    handleAdditionParent(event){
        this.count++;

    }

    handleSubtractionParent(event){
        this.count--;
    }

    handleProgressBar(event){
        //here event refers to Custom event from child.
        console.log('Here is the custom event '+event);
        this.progressValue= event.detail;
    }

}