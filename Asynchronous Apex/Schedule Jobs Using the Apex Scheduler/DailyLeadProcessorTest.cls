@isTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob(){
        List<Lead> leads = new List<lead>();
        for (Integer i=0; i<200; i++){
            Lead l = new Lead(
            FirstName = 'First ' + i,
            LastName = 'LastName',
            Company = 'The Inc'
            );
            leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        
        DailyLeadProcessor ab = new DailyLeadProcessor();
        String jobId = System.schedule('jobName', '0 5 * * * ?', ab);
        Test.stopTest();
        
        List<Lead> checkleads = new List<Lead>();
        checkleads = [select Id From Lead Where LeadSource = 'Dreamforce' and Company = 'The Inc'];
        
        System.assertEquals(200, checkleads.size(), 'Leads were not created');
    }
}
