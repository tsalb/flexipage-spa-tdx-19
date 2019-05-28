```jsx

/* AnyComponent.cmp VERSION ONE - Boilerplate... Boilerplate... */
<aura:attribute name="data" type="Object"/>
<aura:attribute name="columns" type="List"/>
<aura:handler name="init" value="{! this }" action="{! c.doInit }"/>
<lightning:datatable 
  data="{! v.data }"
  columns="{! v.columns }"/>

// AnyComponentController.js
doInit : function (component, event, helper) {
  component.set('v.columns', [
    { label: 'Contact Name', fieldName: 'Name', type: 'text'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone'},
    { label: 'Email', fieldName: 'Email', type: 'email'},
    // ad infinitum
  ]);
  helper.getData(component);
}

// AnyComponentHelper.js
getData : function(component) {
  var action = component.get('c.getContacts');

  ...

  $A.enqueueAction(action);
}