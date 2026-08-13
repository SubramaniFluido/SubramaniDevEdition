import { LightningElement } from 'lwc';
import image_Url from '@salesforce/resourceUrl/QuickLinks';
import { NavigationMixin } from 'lightning/navigation';

export default class QuickLinks extends NavigationMixin(LightningElement) {

    data =[
        {
            id: 1,
            image: image_Url + '/skillset.png',
            name: 'Skillset'

        },
        {
            id: 2,
            image: image_Url + '/project.png',
            name: 'Experiences'
        },
        {
            id: 3,
            image: image_Url + '/certifications.png',
            name: 'Certifications'
        },
        {
            id: 4,
            image: image_Url + '/contactMe.png',
            name: 'Contact Me'
        }
    ];

    handleClick(event){

        let selectedId = event.currentTarget.dataset.id;

        if(selectedId ==1){
            this.navigateToPages('Skillset__c');
        }else if(selectedId ==2){
            this.navigateToPages('ProjectExperiences__c');
        }else if(selectedId ==3){
            this.navigateToPages('certifications__c');
        }else{
            this.navigateToPages('contactme__c');
        }
        
    }

    navigateToPages(pageApiName){
        this[NavigationMixin.Navigate]({
            type: 'comm__namedPage',
            attributes: {
                name: pageApiName,
            }
        })
    }
}