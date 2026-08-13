import { LightningElement,api } from 'lwc';
import image_Url from '@salesforce/resourceUrl/QuickLinks';

export default class SkillSet extends LightningElement {

    @api SkillName01;
    @api SkillName02;
    @api SkillName03;
    @api SkillName04;
    @api SkillName05;
    @api SkillName06;
    @api SkillName07;
    @api SkillValue01;
    @api SkillValue02;
    @api SkillValue03;
    @api SkillValue04;
    @api SkillValue05;
    @api SkillValue06;
    @api SkillValue07;
    @api FocusSkill01;
    @api FocusSkill02;
    @api FocusSkill03;
    @api FocusSkill04;
    @api FocusSkill05;
    @api FocusSkill06;
    @api FocusSkillValue01;
    @api FocusSkillValue02;
    @api FocusSkillValue03;
    @api FocusSkillValue04;
    @api FocusSkillValue05;
    @api FocusSkillValue06;

    SkillSetImage = image_Url + '/skills.png';

}