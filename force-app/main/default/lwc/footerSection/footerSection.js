import { LightningElement } from 'lwc';
import image_Url from '@salesforce/resourceUrl/QuickLinks';

export default class FooterSection extends LightningElement {

    apjImage = image_Url + '/apj.png';

    motivation = '"Education is the most powerful weapon which you can use to change the world."'

    linkedInUrl = 'https://www.linkedin.com/in/subramanikumarasamy/';
    trailheadUrl = 'https://www.salesforce.com/trailblazer/subramanikumarasamy';
    whatsappUrl= 'https://wa.me/+919489463843';

    mobile = 'tel:+358401682152';
    email = 'mailto:subramani.rkumarasamy@gmail.com';

    linkedinIcon = image_Url + '/linkedIn.png';;
    trailheadIcon = image_Url + '/trailhead.png';;
    whatsappIcon = image_Url + '/whatsapp.png';;

}