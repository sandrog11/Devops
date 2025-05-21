@isTest
public class TestRestrictContactByName {
    static testMethod void  Test() 
    {
        
        List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(FirstName='Raam', LastName='Leela' , email='ramleela@test.com');
        Contact c2 = new Contact(FirstName='gatsby', LastName = 'INVALIDNAME',email='gatsby@test.com');
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
        try
        {
            insert listContact;
        }
        catch(Exception ee)
        {
        }
        
        Test.stopTest(); 
        
    }
}