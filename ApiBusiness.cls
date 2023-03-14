//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm
/*
----------------------------------------------------------
* Nombre: ApiBusiness
* Autor Saúl González
* Proyecto: Prueba
* Descripción : Clase que se encarga de procesar la información para el negocio del servicio y los datos de la tabla

* --------------------------------------------------------------------------------
* Versión       Fecha           Autor                   			Desripción<p />
* --------------------------------------------------------------------------------
* 1.0           14/03/2023     Saúl González	           		   	Creación
* --------------------------------------------------------------------------------
*/


public class ApiBusiness {

     /*
    * @description consume la información de respuesta del WS 
    * @param Object mapResponse
	* @return  List<reddit_items__c> retListO
    */
    public static List<reddit_items__c>  processData(Map<String, Object> mapResponse){
        List<reddit_items__c> retListO = new  List<reddit_items__c>();
        if(!mapResponse.isEmpty()){
            for (String key : mapResponse.keySet()) {
            	String jsonB = JSON.serialize(mapResponse.get(key));
                if(key.equals('data')){
                    Map<String, Object> mapdata = (Map<String, Object>) JSON.deserializeUntyped(jsonB);
                    String jsonD = JSON.serialize(mapdata.get('children'));
                    List<Object> mapChild = (List<Object>) JSON.deserializeUntyped(jsonD);
                    for(Object o : mapChild){
                        Map<String, Object> kData =(Map<String, Object>)  JSON.deserializeUntyped(Json.serialize(o));
                        Map<String, Object> dataRes = (Map<String, Object>) kData.get('data');
                        reddit_items__c ri = new reddit_items__c();
                        ri.AuthorFullname__c = (String) dataRes.get('author_fullname');
                        ri.Selftext__c = (String) dataRes.get('selftext');
                        ri.Thumbnail__c = (String) dataRes.get('thumbnail');
                        ri.Title__c = (String) dataRes.get('title');
                        retListO.add(ri);
                    }
                }
            }
        }
        
        return retListO;
    }
    
    /*
    * @description guarda registros a la tabla redditItems
    * @param List<reddit_items__c> lstRedditItems
	* @return boolean true
    */
    public static boolean saveRecords(List<reddit_items__c> lstRedditItems) {
        boolean resp = false;
        if(lstRedditItems!=null && !lstRedditItems.isEmpty()){
            insert lstRedditItems;
            resp = true;
        }
        return resp;
    }
       
}