```jsx

/* AccountSelector.cmp */
<c:EventService aura:id="eventService"/>
<lightning:combobox
  label="Accounts"
  placeholder="Choose an Account"
  onchange="{! c.handleAccountOptionSelected }"/>

// AccountSelectorController.js
handleAccountOptionSelected : function(component, event, helper) {
  helper.eventService(component).fireAppEvent("ACCOUNT_ID_SELECTED", event.getParam("value"));
}

/* ContactDatatable.cmp */
<aura:handler event="c:ServiceAppEvent" action="{! c.handleApplicationEvent }"/>    // This can break the chains of VF thinking

// ContactDatatableController.js
handleApplicationEvent : function(component, event, helper) {
  let params = event.getParams();
  switch(params.appEventKey) {
    case "ACCOUNT_ID_SELECTED": // fallthrough
    case "CONTACTS_UPDATED":
      helper.loadContactTable(component, params.appEventValue); // accountId string
      break;
    case "HEADER_CLEARTABLE":
      component.set("v.tableData", null);
      break;
  }
}



