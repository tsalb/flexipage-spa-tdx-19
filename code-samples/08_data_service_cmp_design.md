```jsx

/* DataService.cmp */
<aura:component controller="DataServiceCtrl">

  /* For AccountSelector.cmp */
  <aura:method name="fetchAccountCombobox" action="{! c.handleFetchAccountCombobox }">          // Step 1
    <aura:attribute name="callback" type="function"/>
  </aura:method>

  /* For ContactDatatable.cmp */
  <aura:method name="fetchContactsByAccountId" action="{! c.handleFetchContactsByAccountId }">
    <aura:attribute name="accountIdEventArg" type="String"/>
    <aura:attribute name="callback" type="function"/>
  </aura:method>

</aura:component>

// DataServiceController.js
handleFetchAccountCombobox : function(component, event, helper) {                               // Step 2
  let params = event.getParam("arguments");
  let action = component.get("c.getAccountOptions");
  helper.dispatchAction(component, action, params);
},
handleFetchContactsByAccountId : function(component, event, helper) {
  let params = event.getParam("arguments");
  let action = component.get("c.getContactsByAccountId");
  action.setParams({                                                                            // Step 2.5 (optional)
    accountId : params.accountIdEventArg
  });
  helper.dispatchAction(component, action, params);
}

// DataServiceHelper.js
dispatchAction : function(component, action, params) {                                          // DRY
  action.setCallback(this, (response) => {
    if (response.getState() === "SUCCESS") {
      params.callback(null, response.getReturnValue());
    } else {
      params.callback(response.getError());
    }
  });
  $A.enqueueAction(action);
}