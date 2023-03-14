({  
    pullData:function(component){
        component.set("v.isLoading", true); 
        var action=component.get("c.getListRedIt");       
        action.setCallback(this,function(e){
            component.set("v.isLoading", false);
            if(e.getState()=='SUCCESS'){
                var results=e.getReturnValue();              
                console.log(results);
                if(results.length>0){
                    component.set('v.results', results);                                                           
                }
                else{
                    component.set('v.results', []);                                        
                }
            }
            else{
                this.showToast("ERROR","error",JSON.stringify(e.getError()));   
            }
        });
        $A.enqueueAction(action);
    },
    updateObject : function(component, event){
        component.set("v.isLoading", true); 
        var action=component.get("c.getInfoReq");       
        action.setCallback(this,function(e){
            component.set("v.isLoading", false);
            if(e.getState()=='SUCCESS'){
                
            }
            else{
                this.showToast("ERROR","error",JSON.stringify(e.getError()));   
            }
        });
        $A.enqueueAction(action);
    }
    ,
    viewRecord : function(component, event) {
        var row = event.getParam('row');
        var recordId = row.Id;
        var viewRec=$A.get("event.force:navigateToSObject");
        viewRec.setParams({
            "recordId": recordId,
            "slideDevName": "detail"
        });
        viewRec.fire();
    },
    
    editRecord : function(component, event) {
        var row = event.getParam('row');
        var recordId = row.Id;
        $A.get("e.force:editRecord").setParams({"recordId": recordId}).fire();
    },  
    
    deleteRecord : function(component, event) {
        component.set("v.isLoading", true); 
        var row = event.getParam('row');  
        var recordId = row.Id;
        var action = component.get("c.delRecordItem");
        action.setParams({
            "recordId": recordId
        });
        
        action.setCallback(this, function(response) {
            component.set("v.isLoading", false);            
            if (response.getState() === "SUCCESS" ) {
                this.showToast("Success!","success","The record has been delete successfully.");
            }
            else{
                this.showToast("ERROR","error",JSON.stringify(response.getError())); 
            }
        });
        $A.enqueueAction(action);
    },
    
    showToast:function(title,type,message){
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({"title": title,"type": type,"message": message}).fire();
        }
        else{
            alert(message);
        }
    },
 })