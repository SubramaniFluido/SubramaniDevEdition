import { LightningElement, track } from 'lwc';

export default class DragAndDropComponent extends LightningElement {
    @track listOne = ['Item 1', 'Item 2', 'Item 3'];
    @track listTwo = [];

    handleDragStart(event){
        event.dataTransfer.setData('text', event.target.dataset.item);
    }

    handleDragOver(event){
        event.preventDefault();
    }

    handleDrop(event){
        event.preventDefault();

        const item = event.dataTransfer.getData('text');
        const list = event.target.dataset.list;

        if(list == 'list'){
            this.listOne = this.list.filter(i => i !== item);
            this.listTwo = [...this.listTwo, item];
        } else if( list === 'list2'){
            this.listTwo = this.listTwo.filter( i => i !== item);
            this.listOne = [...this.listOne, item];
        }
    }
}