import { LightningElement } from 'lwc';
import image_Url from '@salesforce/resourceUrl/QuickLinks';
import Description from '@salesforce/schema/Account.Description';

export default class WorkExperiences extends LightningElement {

    experienceImage = image_Url + '/projectExperience.png';

    experienceData =[

        {
            id: 1,
            name: 'Salesforce Technical Product Manager',
            company: 'Smartly.io',
            role: 'Team Lead, Lead Developer, Solution Architect',
            description: 'Directed the complete redesign of Smartly\'s Salesforce ecosystem. Oversaw and implemented multiple systems integration, process automation, and system migrations. Acted as the primary point of contact for all Salesforce-related matters. Leadership of team operations, mentorship to junior team member, facilitation of training sessions and product roadmap development in alignment with organisational objectives. Formed the Salesforce team and ways of working to operationalise the salesforce team in the global cross functional business teams.',
            responsibilities: [
                'Translation of business requirements into actionable functional and technical specifications; identification of operational improvement areas for Salesforce-based automation solution.',
                'Evaluate and select third-party applications and AppExchange solutions based on business needs and architecture compatibility; established strategic partnerships with vendors for third-party solutions.',
                'Designed and developed applications, integrations, managed packages, and customisations to ensure usability and scalability; achieved a 70% improvement in platform scalability while reducing technical debt.',
                'Executing and leading many impactful Salesforce projects that enhanced business efficiency including custom sales commission logic, migrated revenue forecasting from Google sheet to Salesforce, Consolidated products and offerings, built ticketing management system for CS Organisation.',
                'Redesigned CRM workflows decreased manual efforts by 40% and improved data accuracy for more informed decision-making.'
            ],
            tools: [
                'Figma', 'Miro', 'UML', 'Salesforce Sales Cloud', 'Apex', 'Flow', 'Lightning Web Component', 'Apex Trigger', 'Asynchronous Apex', 'Integrations', 'Apex Web Service', 'HubSpot', 'Marketo', 'UserGems', 'Gong', 'Outreach', 'LinkedIn Sales Navigator', 'LeadIQ', 'RingLead', 'Summize', 'Docusign', 'Intercom', 'Zendesk', 'Internal Billing System', 'Snowflake', 'Slack', 'Tableau', 'In-house SaaS Platform'
            ]
        },
        {
            id: 2,
            name: 'Hobby Projects',
            company: 'Freelancing Projects',
            role : 'Salesforce Trainer',
            description: 'Trained 1000+ professionals in Salesforce technology globally, focusing on corporate trainings for APAC, EMEA and NORAM clients. Achieved a 95% satisfaction rate among trainees.',
            responsibilities: [
                'Developed customised training programs to enhance participants\' skills and knowledge in Salesforce.',
                'Implemented interactive training methods to ensure effective learning outcomes.',
                'Specialised in individual mentorship and trainings',
                'Created and implemented a training program to increase the training capacity of the team.',
                'Led the team of internal trainers in North America.',
                'Ran multiple project hands-on project workshops',
                'Running Kahoot quizzes'           
            ],
            tools:[
                'Trailhead', 'Salesforce Documentations', 'External Resources', 'Google Document', 'Microsoft Office'
            ]
        },
        {
            id: 3,
            name: 'Pro-bono Project',
            role: 'Technical Book Reviewer',
            company: 'BPB Publications',
            description: 'Worked as the Technical Reviewer of two Salesforce books published by BPB Publications',
            responsibilities: [
                'Reviewed technical content of the books and provided feedback to the authors.',
                'Reviewed Rapid SaaS Application Development using Salesforce & Salesforce Apex Design Patterns books.'
            ],
            tools:[
                'Salesforce Documentation', 'External Resources', 'Microsoft Word'
            ]
        },
        {
            id: 4,
            name: 'Digital Omni-Channel and Goverance',
            company: 'Telecom',
            role: 'Salesforce Architect and Lead Developer',
            description: 'Led architectural planning and worked on the technical implementation on the salesforce side for a centralised Customer 360 platform to unify customer data across all channels.',
            responsibilities: [
                'Led the technical implementation of the project, including the design and development of the technical solution.',
                'Developed the technical solution and managed the implementation of the solution.',
                'Designed data model and governance on the Salesforce side for B2B and B2C customers.',
                'Implemented Salesforce side business requirements by collaborating with cross functional teams.',
                'Delivered different Lightning Web components and Streaming APIs for different business requirements.'
            ],
            tools:  [
                'UML', 'Miro', 'Apex', 'data model', 'Security & governance', 'Streaming API', 'Lightning Web Components', 'Experience cloud', 'Dell Boomi', 'other B2B & B2C systems', 'in-house customer 360 system'
            ]
        },
        {
            id: 5,
            name: 'B2B One Order Per Basket Upgradation Project',
            company: 'Telecom',
            role: 'Salesforce Lead Developer',
            description: 'Played a key role in a large-scale digital transformation initiative by analysing the impact of proposed changes in the upgraded Cloudsense CPQ data model. Designed and implemented a scalable data architecture to support a new multi-order basket system, ensuring seamless integration with existing processes and improving order management efficiency.',
            responsibilities: [
                'Designed and implemented salesforce data model to support the multi-order basket system.',
                'Identified the impacted objects, fields, workflow rules, validation rules, formula fields, flows, apex, integrations, lightning web components, visualforce pages, report types, reports and dashboards and upgraded all the components as a team.',
                'Worked with cross-functional teams in agile sprints',
                'Mentored and supported junior developers in the team.',
                'Collaborated with cross vendor team for the QA testing.'
            ],
            tools:  [
                'Apex', 'Asynchronous Apex', 'Objects and Fields', 'Workflow Rules', 'Validation Rules', 'Flows', 'Apex Trigger', 'Integrations', 'Lightning Web Components', 'Visualforce Pages', 'Report Types', 'Reports and Dashboards', 'Dell Boomi', 'Integrations', 'Web Service', 'Cloudsense CPQ'
            ]
        },
        {
            id: 6,
            name: 'B2B Digital Transformation Migration Project',
            company: 'Telecom',
            role: 'Salesforce Lead Developer',
            description: 'Contributed to a major digital transformation project by migrating Elisa\'s Palvelupäätelaite service from a legacy CRM to Salesforce. Worked extensively on product modelling, billing integration, Case Management and Cloudsense CPQ configuration.',
            responsibilities: [
                'Developed integration between Salesforce and Amdoc billing system via Dell Boomi',
                'Built complex product bundles using Cloudsense CPQ',
                'Worked with cross-functional teams in agile sprints',
                'Mentored and supported junior developers in the team.',
                'Collaborated with cross vendor team for the QA testing.',
            ],
            tools:  [
                'Salesforce Sales Cloud', 'Service Cloud', 'Experience Cloud', 'Apex', 'Dell Boomi', 'Integrations', 'Web Service', 'Cloudsense CPQ'
            ]
        },
        {
            id: 7,
            name: 'Pro-bono Project',
            company: 'Confidential (NGO)',
            role: 'Salesforce Solution Architect',
            description: 'Provided architectural oversight and resolution of ongoing technical issues for the NGO using Experience cloud and Salesforce core features. Implemented improvements for donation processing and volunteer management.',
            responsibilities : [
                'Led a team of developers in bug resolution and system refactoring.',
                'Integrated Stripe payment gateway',
                'Implemented asynchronous processing for high-traffic events',
                'Implemented a solution for lead management and lead assignment.'
            ],
            tools: [
                'Miro', 'Apex', 'Asynchronous Apex', 'Integrations', 'Web Service', 'Experience cloud', 'Sales Cloud','Workbench'
            ]
        },
        {
            id: 8,
            name: 'Internal Training Tracking System',
            company: 'Confidential (Government)',
            role: 'Salesforce Consultant and QA Test Lead',
            description: 'Participated in the development and quality assurance of a secure self-service portal built on Salesforce Experience Cloud for a large government organization. The portal was designed to provide users with streamlined access to essential services, request management, and personalized information, training management, significantly reducing dependency on manual administrative processes.',
            responsibilities : [
                'Contributed as the individual Salesforce consultant to customise the salesforce application to build and track the training system using experience cloud.',
                'Led the QA team members to complete the quality assurance testing, test cases and defect management.'
            ],
            tools: [
                    'Apex', 'Lightning Aura Components', 'Jira', 'Experience Cloud', 'Sales Cloud', 'Object and Fields', 'Security and Sharing', 'Process Builder', 'Integrations','Workbench'
            ]
        },
        {
            id: 9,
            name: 'Corporate Training',
            company: 'Confidential (Government)',
            role: 'Corporate Trainer',
            description: 'As a Corporate Salesforce Trainer, I specialize in equipping business users and teams with the knowledge and skills needed to effectively use the Salesforce system. The training programs are tailored to business functions and workflows, ensuring participants can navigate, utilize, and adopt Salesforce tools with confidence. Sessions are designed to be clear, task-focused, and aligned with real-world business processes.',
            responsibilities : [
                'Develop and prepare training materials focused on practical use of the Salesforce system',
                'Conduct structured half-day online training sessions tailored to user roles and business needs',
                'Prepare detailed scripts and visual walkthroughs to guide users through core Salesforce functionalities',
                'Organize interactive workshops to simulate real use cases such as data entry, reporting, and approvals',
                'Document key processes and step-by-step instructions for future reference and onboarding',
                'Provide clear guidance during sessions, ensuring active participation and addressing questions',
                'Collect feedback from participants to refine training delivery and update learning resources.'
            ],
            tools: [
                    'Microsoft Office Suite'
            ]
        },
        {
            id: 10,
            name: 'Case Management System for Policy Compliance',
            company: 'Prudential Insurance (Insurance)',
            role: 'Salesforce Lead Developer and Team Lead',
            description: 'Led the migration of the legacy Lotus Notes system to Salesforce to support a case management system. The platform was designed to enable operations and field agents to collaborate effectively in identifying and resolving policy compliance issues.',
            responsibilities : [
                'Acted as a single point of contact for the client and led the project management and delivery.',
                'Managed end-to-end project activities including estimation, requirement gathering, analysis, design, development, deployment, and post-go-live technical support for critical production incidents.',
                'Enhanced scalability of the application through code reviews and design documentation.',
                'Directed daily interactions with an offshore development team of 3-7 members to ensure timely progress on system migration to the Salesforce platform and client product deliveries.',
                'Conducted system gap analysis in design review sessions with clients and architecture teams while coordinating with middleware and integration teams to ensure seamless connectivity between source/destination systems.'
            ],
            tools: [
                    'UML', 'Lucidchart', 'Apex', 'Lightning Aura Components', 'Jira', 'Sales Cloud', 'Service Cloud', 'Integrations', 'Dell Boomi', 'Asynchronous Apex', 'Data Model Designing', 'Security and Governance','Workbench'
            ]
        },
        {
            id: 11,
            name: 'Investment Portfolio Management Application',
            company: 'PGIM Real Estate Finance, LLC ( Real Estate)',
            role: 'Salesforce Developer',
            description: 'Developed a Salesforce-based solution to manage PGIM\'s real estate investment portfolios. The platform enabled real-time tracking of asset performance and streamlined portfolio analysis.',
            responsibilities : [
                'Designed data model and security framework.',
                'Worked as a salesforce developer of 3 member team and managed all the configuration and customisation tasks of the waterfall project.',
                'Responsible for QA testing, test documentations, user manual preparation and QA testing support.',
                'Managed deployments using change sets.',
                'Proper handover to the Application Maintenance team.'
            ],
            tools : [
                'Salesforce Objects', 'Fields', 'Validation Rules', 'Workflow Rules', 'Process Builders', 'Triggers', 'Asynchronous Apex', 'Salesforce Sales Cloud', 'Workbench'
            ]
        },
        {
            id: 12,
            name: 'Investment Management Migration Project',
            company: 'Hartford Insurance (Insurance)',
            role: 'Salesforce Developer',
            description: 'Involved in the migration of an enterprise insurance CRM from Oracle to Salesforce. Focused on the Account and User Management modules to ensure seamless migration and improve data accuracy and accessibility.',
            responsibilities : [
                'Designed data model and security framework.',
                'Worked as a salesforce developer of 10 member team and managed all the configuration and customisation tasks of the waterfall project.',
                'Configured profiles, roles, sharing rules as per the business requirement.',
                'Responsible for QA testing, test documentations, user manual preparation and QA testing support.',
                'Managed deployments using change sets.',
                'Proper handover to the Application Maintenance team.'
            ],
            tools : [
                'Salesforce Objects', 'Validation Rules', 'Workflow Rules', 'Process Builders', 'Triggers', 'Asynchronous Apex', 'Salesforce Sales Cloud', 'Salesforce Service Cloud', 'Data Loader', 'Import Wizard'
            ]
        },
        {
            id: 13,
            name: 'Internal Ticket Management System',
            company: 'Prudential Insurance (Insurance)',
            role: 'ServiceNow Developer',
            description: 'Developed and maintained an internal ticket management platform for Prudential Insurance using ServiceNow. The objective was to streamline internal IT service request processing, reduce turnaround time, and improve cross-department collaboration.',
            responsibilities : [
                'Designed and configured ServiceNow modules',
                'Developed client scripts and server-side scripts',
                'Built automation for ticket categorisation and routing',
                'Responsible for QA testing, test documentations, user manual preparation and QA testing support.',
                'Managed deployments using change sets.',
                'Proper handover to the Application Maintenance team.'
            ],
            tools : [
                'ServiceNow', 'Javascript'
            ]
        }
    ]
}