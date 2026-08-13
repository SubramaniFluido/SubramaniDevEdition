import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import messageChannel from '@salesforce/messageChannel/MyMessageChannel__c';


export default class LMSPublisher extends LightningElement {
    
    message;
    
    handleInput(event){
        this.message= event.target.value;
    }

    @wire(MessageContext)
    messageContext;

    handlePublish(event){

        let message= {message: this.message};
        //parmeters --> wire context message fetched from LDS, Message channel imported, data to be sent - Object/JSON format
        publish(this.messageContext, messageChannel, message);
    }

}