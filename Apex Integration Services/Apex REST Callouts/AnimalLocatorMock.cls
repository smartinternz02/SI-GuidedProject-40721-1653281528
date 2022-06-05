@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        //response.setBody('{"animals":{"id":1,"name":"chicken"}}');
        response.setStatusCode(200);
        return response; 
    }
}
