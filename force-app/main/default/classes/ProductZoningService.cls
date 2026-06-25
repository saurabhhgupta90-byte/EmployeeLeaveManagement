@RestResource(urlMapping='/ProductZoning/*')
global with sharing class ProductZoningService {
    
    @HttpGet
    global static String getPermissibleFlyZone() {
        RestRequest req = RestContext.request;
        String countryCode = 'US'; 
        
        if (req.headers != null && req.headers.containsKey('CountryCode')) {
            countryCode = req.headers.get('CountryCode');
        }
        if (String.isBlank(countryCode)) {
            countryCode = 'US';
        }

        String productCode = req.params.get('ProductCode');
        
        if (String.isBlank(productCode)) {
            return 'ProductCode is missing or doesn\'t exist';
        }
        
        List<Product2> products = [SELECT Family FROM Product2 WHERE ProductCode = :productCode LIMIT 1];
        
        if (products.isEmpty() || String.isBlank(products[0].Family)) {
            return 'ProductCode is missing or doesn\'t exist';
        }
        
        String productFamily = products[0].Family;
        
        List<Product_Geo_Mapping__mdt> mappings = [
            SELECT Permissible_Fly_Zone__c 
            FROM Product_Geo_Mapping__mdt 
            WHERE Product_Family__c = :productFamily 
            AND Country_Code__c = :countryCode 
            LIMIT 1
        ];
        
        if (!mappings.isEmpty() && String.isNotBlank(mappings[0].Permissible_Fly_Zone__c)) {
            return mappings[0].Permissible_Fly_Zone__c;
        } else {
            return 'Confirm with the local authorities';
        }
    }
}