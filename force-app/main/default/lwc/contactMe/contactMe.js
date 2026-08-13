import { LightningElement, track } from 'lwc';
import sendContactEmail from '@salesforce/apex/ContactController.sendContactEmail';
import image_Url from '@salesforce/resourceUrl/QuickLinks';

export default class ContactMe extends LightningElement {
    contactImageUrl = image_Url + '/contactMepic.png';

    @track formData = this._initializeFormData();

    submitSuccess = false;
    submitError = false;

    urgencyOptions = [
        { label: 'Low', value: 'Low' },
        { label: 'Medium', value: 'Medium' },
        { label: 'High', value: 'High' }
    ];

    _initializeFormData() {
        return {
            name: '',
            email: '',
            mobile: '',
            company: '',
            country: '',
            requirement: '',
            urgency: '',
            budget: ''
        };
    }

    handleChange(event) {
        const { name, value } = event.target;
        this.formData = { ...this.formData, [name]: value };
        this.submitSuccess = false;
        this.submitError = false;
    }

    async handleSubmit(event) {
        event.preventDefault();

        if (!this._isFormValid()) {
            this.submitError = true;
            this.submitSuccess = false;
            return;
        }

        try {
            await sendContactEmail({ contactData: this.formData });
            this.submitSuccess = true;
            this.submitError = false;
            this.formData = this._initializeFormData();
        } catch {
            this.submitError = true;
            this.submitSuccess = false;
        }
    }

    _isFormValid() {
        return (
            this.formData.name.trim() &&
            this.formData.email.trim() &&
            this.formData.mobile.trim() &&
            this.formData.requirement.trim() &&
            this.formData.urgency.trim()
        );
    }
}