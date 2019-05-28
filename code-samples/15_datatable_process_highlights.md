```jsx

/* AnyComponent.cmp VERSION TWO - SOQL it */
<c:DataTableService aura:id="tableService"/>
<aura:attribute name="data" type="Object"/>
<aura:attribute name="columns" type="List"/>
<aura:handler name="init" value="{! this }" action="{! c.doInit }"/>
<lightning:datatable 
  data="{! v.data }"
  columns="{! v.columns }"/>

// AnyComponentController.js
doInit : function(component, event, helper) {
  let soql = "SELECT "
           + "Id, Name, Phone, Email "
           + "FROM Contact "
           + "WHERE Id = \'"+component.get("v.recordId")+"\'";
           
  helper.tableService(component).fetchData(
    { queryString: soql },
    $A.getCallback((error, data) => {
      if (data && data.tableData && data.tableColumns) {
        component.set("v.data", data.tableData);
        component.set("v.columns", data.tableColumns);
      }
    });
  );
}