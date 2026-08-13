Public class visualInput{

    Public String accountName {set;get;}
    Public Account acc{set;get;}
    
    Public void accountsearch(){
    
    acc= [SELECT Id, Name,Industry from Account where Name =: accountName ];
       }
    }