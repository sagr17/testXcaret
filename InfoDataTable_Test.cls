//https://www.apexhours.com/apex-test-class-best-practices/
//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm
@isTest
private class InfoDataTable_Test {

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
    
    @isTest static void testInfoDataTable() {
        Test.startTest();
        	InfoDataTable.getInfoReq();
        Test.stopTest();
    }
    
    @isTest static void testGetListRedIt() {
        
        Test.startTest();
        	InfoDataTable.getListRedIt();
        Test.stopTest();
    }
    
    @isTest static void testDelRecordItem() {
        Id riId = [SELECT Id FROM reddit_items__c limit 1].Id;
        
        Test.startTest();
        	InfoDataTable.delRecordItem(riId);
        Test.stopTest();
    }
    
}