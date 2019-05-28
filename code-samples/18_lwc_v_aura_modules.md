```jsx

/* Aura */
<c:DataService aura:id="service"/>

helper.service(component).fetchAccountCombobox(
  $A.getCallback((error, data) => {
    helper.processResults();
  });
);

/* LWC */
import fetchAccountCombobox from '@salesforce/apex/DataServiceCtrl.fetchAccountCombobox';

@wire(fetchAccountCombobox)
wiredOptions({ error, data }) {
  this.processResults();
}