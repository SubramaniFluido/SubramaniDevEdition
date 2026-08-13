trigger UserTrigger on User (after insert) {
    List<Contact> conList = new List<Contact>();
    Contact con = new Contact();
    con.LastName = 'Hi';
    conList.add(con);
    insert conList;
   
}