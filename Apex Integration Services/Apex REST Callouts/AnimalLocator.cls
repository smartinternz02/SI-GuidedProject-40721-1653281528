public class AnimalLocator {
     public static string getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
         Map<String,Object> animals = new Map<String,Object>();
        HttpResponse res = http.send(req);
        // If the request is successful, parse the JSON response.
        if(res.getStatusCode() == 200) {
             Map<String,Object> results = (Map<String,Object>) 
             JSON.deserializeUntyped(res.getBody());
             animals = (Map<String,Object>)results.get('animal'); 
        }
         else{
               System.debug('The status code returned was not expected:'+res.getStatusCode()+''+res.getStatus());
         }
        return (string)animals.get('name');   

}
}
