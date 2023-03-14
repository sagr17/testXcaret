//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm
/*
----------------------------------------------------------
* Nombre: InfoDataTable
* Autor Saúl González
* Proyecto: Prueba
* Descripción : Clase que se encarga de mostrar y eliminar los registros de la tabla

* --------------------------------------------------------------------------------
* Versión       Fecha           Autor                   			Desripción<p />
* --------------------------------------------------------------------------------
* 1.0           14/03/2023     Saúl González	           		   	Creación
* --------------------------------------------------------------------------------
*/

public class InfoDataTable {

    /*
    * @description actualiza la tabla a partir de la consulta de registros al WS
    * @param 
	* @return Map<String, Object> dataReturn
    */
    
	@AuraEnabled
    public static Map<String, Object> getInfoReq(){
        Map<String, Object> dataReturn = new Map<String, Object>();
        Map<String, Object> resp = ApiCallout.apiRequest('paramSearch');
		List<reddit_items__c> respProc = ApiBusiness.processData(resp);
		boolean respBol = ApiBusiness.saveRecords(respProc);
        dataReturn.put('response','Suc');
        dataReturn.put('code',0);
        dataReturn.put('respBool',respBol);
        return dataReturn;
    }
    
    
    /*
    * @description consulta los registros para mostrar en la tabla del componente AURA
    * @param 
	* @return List<reddit_items__c> reddit_items__c 
    */
    @AuraEnabled
    public static List<reddit_items__c> getListRedIt(){
        //List<reddit_items__c> lstRedItems = [SELECT id, name, Title__c, AuthorFullname__c, Thumbnail__c, Selftext__c  from reddit_items__c order by CreatedDate Desc];
        return [SELECT id, name, Title__c, AuthorFullname__c, Thumbnail__c, Selftext__c  from reddit_items__c 
               order by CreatedDate Desc];
    }
     
    
    /*
    * @description método encargado de eliminar el registro del objecto Reddit_Item
    * @param String recordId
	* @return boolean 
    */
    @AuraEnabled
    public static boolean delRecordItem(String recordId){
        reddit_items__c rI =[SELECT id, name  from reddit_items__c where Id =: recordId];
        System.debug(recordId);
        delete rI;
		return true;        
    }
    
}