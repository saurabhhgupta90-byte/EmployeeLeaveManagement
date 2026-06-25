@isTest
private class CertificationStatusServiceTest {

    @isTest
    static void testCertificationStatus() {

        Contact con = new Contact(
            LastName = 'TestContact'
        );
        insert con;

        Certification__c cert = new Certification__c(
            Name = 'Test Cert',
            isActive__c = true
        );
        insert cert;

        // Auto Number field fetch karo
        cert = [
            SELECT Id, Certification_Number__c
            FROM Certification__c
            WHERE Id = :cert.Id
        ];

        Contact_Certification__c cc = new Contact_Certification__c(
           Contact__c = con.Id,
           Certification__c = cert.Id,
           isActive__c = true,
           Issue_Date__c = Date.today()
          );
         insert cc;
            
            
            
       
      

        Test.startTest();

        String result = CertificationStatusService.getCertificationStatus(
            'TestContact',
            cert.Certification_Number__c
        );

        Test.stopTest();

        System.assertEquals('Valid', result);
    }
}