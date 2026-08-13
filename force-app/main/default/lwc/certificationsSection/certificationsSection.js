import { LightningElement } from 'lwc';
import image_Url from '@salesforce/resourceUrl/QuickLinks';

export default class CertificationsSection extends LightningElement {
    
    certificationData = [

        {
            id: 1,
            name: 'Agentforce Innovator',
            company: 'Salesforce',
            image: image_Url + '/agentforceInnovator.png'
        },
        {
            id: 2,
            name: 'Salesforce Associate',
            company: 'Salesforce',
            image: image_Url + '/Associate.png'
        },
        {
            id: 3,
            name: 'Salesforce AI Associate',
            company: 'Salesforce',
            image: image_Url + '/aiAssociate.png'
        },
        {
            id: 4,
            name: 'Salesforce Agentforce Specialist',
            company: 'Salesforce',
            image: image_Url + '/agentForceSpecialist.png'
        },
        {
            id: 5,
            name: 'Salesforce Platform App Builder',
            company: 'Salesforce',
            image: image_Url + '/AppBuilder.png'
        },
        {
            id: 6,
            name: 'Salesforce Administrator',
            company: 'Salesforce',
            image: image_Url + '/admin.png'
        },
        {
            id: 7,
            name: 'Salesforce Platform Developer I',
            company: 'Salesforce',
            image: image_Url + '/pd1.png'
        },
        {
            id: 8,
            name: 'Salesforce Platform Developer II',
            company: 'Salesforce',
            image: image_Url + '/pd2.png'
        },
        {
            id: 9,
            name: 'Salesforce Application Architect',
            company: 'Salesforce',
            image: image_Url + '/appArchi.png'
        },
        {
            id: 10,
            name: 'Salesforce Data Architect',
            company: 'Salesforce',
            image: image_Url + '/DataArchitect.png'
        },
        {
            id: 11,
            name: 'Salesforce Sharing and Visibilty Architect',
            company: 'Salesforce',
            image: image_Url + '/sharingVisibility.png'
        },
        {
            id: 12,
            name: 'Salesforce Integration Architect',
            company: 'Salesforce',
            image: image_Url + '/IntegrationArch.png'
        },
        {
            id: 13,
            name: 'Salesforce Identity and Access Management Architect',
            company: 'Salesforce',
            image: image_Url + '/IAM.png'
        },
        {
            id: 14,
            name: 'Salesforce Service Cloud Consultant',
            company: 'Salesforce',
            image: image_Url + '/serviceCloudConsultant.png'
        },
        {
            id: 15,
            name: 'Salesforce Experience Cloud Consultant',
            company: 'Salesforce',
            image: image_Url + '/experienceConsultant.png'
        },
        {
            id: 16,
            name: 'Salesforce Field Service Consultant',
            company: 'Salesforce',
            image: image_Url + '/fieldServiceConsultant.png'
        },
        {
            id: 17,
            name: 'Copado Findamental MP I',
            company: 'Copado',
            image: image_Url + '/Copado1.png'
        },
        {
            id: 18,
            name: 'Copado Findamental MP II',
            company: 'Copado',
            image: image_Url + '/Copado2.png'
        }
    ]

}