public class BookClass {
    
    Public static void applyDiscount(Book__c[] books){
        for(book__c b: books){
            b.Price__c *=0.9;
        }
    }
}