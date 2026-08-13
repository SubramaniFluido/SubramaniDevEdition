public class attachPDFToAccount {
    
    private final Account a; //Account object
    
    //constructor
    public attachPDFToAccount(ApexPages.StandardController standardPageController) {
        a = (Account)standardPageController.getRecord(); //instantiate the Account object for the current record
    }
    
    //method called from the Visualforce's action attribute
    public PageReference attachPDF() {
        //generate and attach the PDF document
        PageReference pdfPage = Page.PdfGenerate; //create a page reference to our pdfDemo Visualforce page, which was created from the post http://www.interactiveties.com/blog/2015/render-visualforce-pdf.php
        Blob pdfBlob = pdfPage.getContent(); //get the output of the page, as displayed to a user in a browser
        Attachment attach = new Attachment(parentId = a.Id, Name = 'pdfAttachmentDemo.pdf', body = pdfBlob); //create the attachment object
        insert attach; //insert the attachment
        //redirect the user
        PageReference pageWhereWeWantToGo = new ApexPages.StandardController(a).view(); //we want to redirect the User back to the Account detail page
        pageWhereWeWantToGo.setRedirect(true); //indicate that the redirect should be performed on the client side
        return pageWhereWeWantToGo; //send the User on their way
    }

}