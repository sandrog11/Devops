@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void setup(){
        //insert 200 lead to update after
        List<Lead>listlead = new List<Lead>();
        for (Integer i = 0; i<200; i++){
            listlead.add(new Lead(LastName = 'testLastName', Company = 'Accenture', Description = 'Lead '+i,
            City = 'Salerno'));
        }
        insert listlead;
    }
    @istest static void test()
    {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource  = 'Dreamforce']);
    }

}