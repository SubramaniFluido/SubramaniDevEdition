import { LightningElement } from 'lwc';
import CONSULTANT_IMAGE from '@salesforce/resourceUrl/ConsultantImage'; // Replace ConsultantImage with your Static Resource name

export default class PortfolioGoogleSheetDisplay extends LightningElement {
    personImage = CONSULTANT_IMAGE;

    portfolioData = {
        name : 'SUBRAMANI KUMARASAMY',
        description : 'Unlock the full potential of your Salesforce ecosystem with tailored solutions that drive efficiency and growth. I specialize in identifying and resolving critical challenges to ensure your platform scales seamlessly and supports your business goals. Whether you face pipeline visibility issues or technical debts, I provide clear strategies that enhance performance while optimizing costs.',
        expertise : [
            'Delivering high-impact solutions at low cost',
            'Agentforce implementation and optimization',
            'DataCloud integration and management',
            'Comprehensive platform health checks',
            'Addressing platform scalability challenges',
            'Resolving pipeline visibility problems',
            'Reducing technical and data debts',
            'Optimizing data governance and security',
            'One time projects',
            'Consulting on a project-by-project basis',
            'Building custom UI using LWC',
            'Building Integrations',
            'Work in any Salesforce Clouds'
        ]
    };

    handleHireClick() {
        // Placeholder for hire functionality
        console.log('HIRE ME NOW clicked');
    }
}