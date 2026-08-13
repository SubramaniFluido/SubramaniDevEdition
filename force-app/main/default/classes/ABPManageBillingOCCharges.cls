public class ABPManageBillingOCCharges 
{
    public static String staticVariable = 'static variable';
    
    public class ManageBillingCharge{
        public ManageChargeDetails manageBillingOneOffCharge;
    }
    public class ManageChargeDetails {
        public ChargeDetails chargeDetails{get;set;}
    }
    
    public class ChargeDetails {
        public String action{get;set;}
        public String pcn{get;set;}
        public String chargeCode{get;set;} 
    }
}