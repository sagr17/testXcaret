//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm
@isTest
private class ApiCallout_Test {

    
    @testSetup static void setup() {
        // Create common test accounts
        List<reddit_items__c> testRedItem = new List<reddit_items__c>();
        for(Integer i=0;i<10;i++) {
            testRedItem.add(new reddit_items__c(
            AuthorFullname__c='AuthorFullname__c',
			Selftext__c='AuthorFullname__c',
			Thumbnail__c='AuthorFullname__c',
            Title__c='AuthorFullname__c'
            ));
        }
        insert testRedItem;        
    }
    
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        ApiCallout.apiRequest('paramSearch');
        
        // Verify response received contains fake values
        //String contentType = res.getHeader('Content-Type');
        //System.assert(contentType == 'application/json');
        //String actualValue = res.getBody();
        //String expectedValue = '{"example":"test"}';
        //System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, res.getStatusCode());
    }
    
    
    
}