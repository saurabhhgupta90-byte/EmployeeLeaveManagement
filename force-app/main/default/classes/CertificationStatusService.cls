global with sharing class CertificationStatusService {

    webservice static String getCertificationStatus(
        String contactLastName,
        String certificationNumber
    ) {

        List<Contact_Certification__c> records = [
            SELECT Id,
                   isActive__c,
                   Contact__r.LastName,
                   Certification__r.isActive__c,
                   Certification__r.Certification_Number__c
            FROM Contact_Certification__c
            WHERE Contact__r.LastName = :contactLastName
            AND Certification__r.Certification_Number__c = :certificationNumber
            LIMIT 1
        ];

        if(records.isEmpty()) {
            return 'No record found';
        }

        Contact_Certification__c cc = records[0];

        if(cc.isActive__c &&
           cc.Certification__r.isActive__c) {
            return 'Valid';
        }

        return 'Needs Renewal';
    }
}