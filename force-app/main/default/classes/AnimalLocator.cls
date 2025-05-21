public class AnimalLocator {
	public static String getAnimalNameById(Integer id)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        }
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        system.debug('results ->'+ results);
            // Cast the values in the 'animals' key as a list
            Map<string,object> animals = (map<string,object>) results.get('animal');
            System.debug('Received the following animals:' + animals );
        String animal = String.valueOf(animals.get('name'));
        system.debug(animal);
        return String.valueOf(animal);
    }
}