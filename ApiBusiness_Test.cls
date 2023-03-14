@isTest
private  class ApiBusiness_Test {

    
    
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
    
     @isTest static void testProcessData() {
		StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'jsondata' LIMIT 1];
        Test.startTest();
			ApiBusiness.processData((Map<String, Object>) JSON.deserializeUntyped(sr.Body.toString()));
        Test.stopTest();
     
         
         
     }
    
    @isTest static void testSaveRecords() {
		StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'jsondata' LIMIT 1];
		List<reddit_items__c> lstRI= ApiBusiness.processData((Map<String, Object>) JSON.deserializeUntyped(sr.Body.toString()));
        
        Test.startTest();
			ApiBusiness.saveRecords(lstRI);
        Test.stopTest();
     }
}