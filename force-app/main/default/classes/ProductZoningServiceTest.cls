@isTest
private class ProductZoningServiceTest {
    
    @testSetup
    static void setupData() {
        Product2 testProduct = new Product2(
            Name = 'Test Drone', 
            ProductCode = 'GC1040', 
            Family = 'TestFamily'
        );
        insert testProduct;
    }
    
    @isTest
    static void testGetPermissibleFlyZone_Valid() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoning/';
        req.httpMethod = 'GET';
        req.headers.put('CountryCode', 'US');
        req.params.put('ProductCode', 'GC1040');
        RestContext.request = req;
        
        Test.startTest();
        String response = ProductZoningService.getPermissibleFlyZone();
        Test.stopTest();
        
        System.assertNotEquals(null, response);
    }
    
    @isTest
    static void testGetPermissibleFlyZone_MissingCountryCode() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoning/';
        req.httpMethod = 'GET';
        req.params.put('ProductCode', 'GC1040');
        RestContext.request = req;
        
        Test.startTest();
        String response = ProductZoningService.getPermissibleFlyZone();
        Test.stopTest();
        
        System.assertNotEquals(null, response);
    }
    
    @isTest
    static void testGetPermissibleFlyZone_MissingProductCode() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoning/';
        req.httpMethod = 'GET';
        req.headers.put('CountryCode', 'US');
        RestContext.request = req;
        
        Test.startTest();
        String response = ProductZoningService.getPermissibleFlyZone();
        Test.stopTest();
        
        System.assertEquals('ProductCode is missing or doesn\'t exist', response);
    }
    
    @isTest
    static void testGetPermissibleFlyZone_InvalidProductCode() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoning/';
        req.httpMethod = 'GET';
        req.headers.put('CountryCode', 'US');
        req.params.put('ProductCode', 'INVALID_CODE_999');
        RestContext.request = req;
        
        Test.startTest();
        String response = ProductZoningService.getPermissibleFlyZone();
        Test.stopTest();
        
        System.assertEquals('ProductCode is missing or doesn\'t exist', response);
    }
}