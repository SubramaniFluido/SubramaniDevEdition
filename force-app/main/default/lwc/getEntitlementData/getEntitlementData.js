import { LightningElement, api, track } from 'lwc';
import fetchEntitlements from '@salesforce/apex/EntitlementController.fetchEntitlements';

export default class GetEntitlementData extends LightningElement {
    @api recordId; // Automatically injected when component is placed on a record page
    @track entitlements = [];
    @track error;
    @track isLoading = true; // Shows loading spinner initially

    // Lifecycle hook to make the callout when the component loads
    connectedCallback() {
        this.getEntitlementData();
    }

    // Call Apex method to fetch entitlement data
    getEntitlementData() {
        // Reset error and loading states
        this.error = null;
        this.isLoading = true;

        fetchEntitlements({ accountId: this.recordId })
            .then(result => {
                this.entitlements = result;
                this.isLoading = false;
            })
            .catch(error => {
                this.error = 'Error fetching entitlements: ' + error.body.message;
                this.entitlements = [];
                this.isLoading = false;
            });
    }
}