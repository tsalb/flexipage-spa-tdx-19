```jsx

/* AccountSelector.cmp */
<c:DataService aura:id="service"/>
<lightning:combobox
  label="Accounts"
  placeholder="Choose an Account"
  options="{! v.topAccounts }"/>

// AccountSelectorController.js
helper.service(component).fetchAccountCombobox(
  $A.getCallback((error, data) => {
    if (data) {
      component.set("v.topAccounts", data.items);
    }
  });
);