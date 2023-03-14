({
	doInit : function(component, event, helper) {
        var actions = [
            /*{label: 'View', name: 'view'},
            {label: 'Edit', name: 'edit'},*/
            {label: 'Delete', name: 'delete'}
        ];
        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Title', fieldName: 'Title__c', type: 'text'},
            {label: 'AuthorFullname', fieldName: 'AuthorFullname__c', type: 'text'},
            {label: 'Thumbnail', fieldName: 'Thumbnail__c', type: 'text'},
            {label: 'Selftext', fieldName: 'Selftext__c', type: 'text'},
            {type: 'action', typeAttributes: { rowActions: actions } } 
        ]);
        helper.pullData(component);
    },
    handleUpdate : function(component, event, helper){
        helper.updateObject(component, event);
		helper.pullData(component);
    },
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        switch (action.name) {
            case 'view':
                helper.viewRecord(component, event);
                break;
            case 'edit':
                helper.editRecord(component, event);
                break;
            case 'delete':
                helper.deleteRecord(component, event);
                break;
        }
        
		helper.pullData(component);
    },
    
})