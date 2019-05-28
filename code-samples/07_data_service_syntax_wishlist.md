```jsx

/* AccountSelector.cmp */
<lightning:combobox
  label="Accounts"
  placeholder="Choose an Account"
  options="{! v.topAccounts }"/>

// WISHLIST - AccountSelectorController.js
helper.service(component).fetchAccountCombobox(                             // 1) Get Apex, set (optional) params in one step
  // { foo: 'bar'}, optional payload
  $A.getCallback((error, data) => {                                         // 2) Get callback and process response state in one step
    if (error) {
      // oops
    } else {
      helper.processResponse(data);                                         // 3) Done
    }
  });
);

