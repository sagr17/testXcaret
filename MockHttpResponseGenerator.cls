@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://example.com/example/test', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'jsondata' LIMIT 1];
		//return dataReturn = (Map<String, Object>) JSON.deserializeUntyped(sr.Body.toString());
        res.setBody(sr.Body.toString());
        res.setStatusCode(200);
        return res;
    }
}