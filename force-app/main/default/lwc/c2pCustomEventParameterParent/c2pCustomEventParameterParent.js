import { LightningElement } from 'lwc';

export default class C2pCustomEventParameterParent extends LightningElement {
    progressValue;

    progressHandle(event){
        console.log(event);
        this.progressValue =event.detail;
    }
}