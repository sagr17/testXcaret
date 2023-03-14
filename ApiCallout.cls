//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm
//https://www.apexhours.com/apex-test-class-best-practices/
/*
----------------------------------------------------------
* Nombre: ApiCallout
* Autor Saúl González
* Proyecto: Prueba
* Descripción : Clase que se encarga de procesar realizar la petición al servicio REST redditItem

* --------------------------------------------------------------------------------
* Versión       Fecha           Autor                   			Desripción<p />
* --------------------------------------------------------------------------------
* 1.0           14/03/2023     Saúl González	           		   	Creación
* --------------------------------------------------------------------------------
*/

public class ApiCallout {

   
    /*
    * @description se encarga de consumir el WS de datos de Reddit
    * @param String paramSearch
	* @return Map<String, Object> dataReturn
    */
	public static Map<String, Object> apiRequest(String paramSearch) {
        Map<String, Object> dataReturn = new Map<String, Object>();
        Http http = new Http();
        //Cuando el servicio este activo, descomentar
        /*HttpRequest request = new HttpRequest();
        request.setEndpoint('Callout:redditdata');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response);
        System.debug(response.getBody());*/
        //Cuando el servicio este activo, comentar y cambiar a response.getBody() reemplazando sr.Body.toString()
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'jsondata' LIMIT 1];
		return dataReturn = (Map<String, Object>) JSON.deserializeUntyped(sr.Body.toString());
        
    }
}