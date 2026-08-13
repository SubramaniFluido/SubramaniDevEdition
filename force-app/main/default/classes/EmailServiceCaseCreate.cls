global class EmailServiceCaseCreate implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String fromEmailadd;
        List<String> fromNameLst= new List<String>();
        Contact con;
        Case cs;
        Integer conCount=0;
        fromEmailadd= email.fromAddress;
        fromNameLst= email.fromName.split(' ',2);
        try{
            if(String.isNotBlank(fromEmailadd)){
                conCount = [SELECT count() from Contact where email=:fromEmailadd LIMIT 1];
            }
            if(conCount>0){
                con= [SELECT id, name from Contact where email=:fromEmailadd LIMIT 1];
            }
            else if(conCount==0){
                con =new Contact();
                con.FirstName= fromNameLst[0];
                con.LastName= fromNameLst[1];
                con.Email= email.fromAddress;
                insert con;
            }
            cs= new case();
            cs.ContactId= con.id;
            if(email.plainTextBody!=null && email.plainTextBody!=''){
                cs.Description=email.plainTextBody;
            }else{
                cs.Description= 'No description found';
            }
            if(email.subject!=null && email.subject!=''){
                cs.Subject= email.subject;
            }
            else{
                cs.Subject= 'No subject found';
            }
            insert cs;
            result.success= true;
            result.message= 'Successfully created';
            return result;
        }
        catch(Exception ex){
            result.success= false;
            result.message= 'Error Message '+ex.getMessage()+ 'Error Line Number '+ex.getLineNumber();
            return result;
        }
        
    }
}