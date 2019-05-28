```jsx

/* AccountSelector.cmp */
<aura:component controller="DataServiceCtrl"/>                              // 1) Connect component
<lightning:combobox
  label="Accounts"
  placeholder="Choose an Account"
  options="{! v.topAccounts }"/>

// AccountSelectorController.js
let action = component.get("c.getAccountOptions");                          // 2) Get apex method
action.setParams({ foo: 'bar' });                                           // 3) Optionally set parameters via JS Object
action.setCallback(this, function(response) {                               // 4) Set a callback function
  let state = response.getState();  // SUCCESS, INCOMPLETE, ERROR
  helper.processResponse(state);                                            // 5) Measure response and process (on callback!)
});
// action.setStorable();
// action.setBackground();
$A.enqueueAction(action);                                                   // 6) Finally, enqueue and fire the action
