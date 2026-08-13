import { LightningElement } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import stripeJS from '@salesforce/resourceUrl/stripeJS';

export default class Donate extends LightningElement {

    stripeInitialized = false;

    connectedCallback() {
        if (!this.stripeInitialized) {
            this.stripeInitialized = true;
            Promise.all([
                loadScript(this, stripeJS)
            ])
            .then(() => {
                this.initializeStripe();
            })
            .catch(error => {
                console.error('Error loading stripeJS');
                console.error(error);
            });
        }
    }

    initializeStripe() {
        const stripe = Stripe('pk_test_51MuKVsLwm05CI0bosrsqGvJtJ3xnTlGJQX6MOpdqJxvV7ARjnDbcriNCHkzlbAnIlFX4VOXzytskjZ7gVWL4xN2u00JBI0fnER');
        this.template.querySelector('.donation-form').addEventListener('submit', event => {
            event.preventDefault();
            stripe.createToken('card', {
                name: this.template.querySelector('.name-input').value,
                address_line1: this.template.querySelector('.address-input').value,
                address_city: this.template.querySelector('.city-input').value,
                address_state: this.template.querySelector('.state-input').value,
                address_zip: this.template.querySelector('.zip-input').value
            }).then(result => {
                if (result.error) {
                    console.error(result.error.message);
                    const event = new ShowToastEvent({
                        title: 'Error',
                        message: result.error.message,
                        variant: 'error'
                    });
                    this.dispatchEvent(event);
                } else {
                    this.handleToken(result.token);
                }
            });
        });
    }

    handleToken(token) {
        // pass the token to the server-side controller to make the donation
    }
}