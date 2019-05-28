import { LightningElement, track, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import getAccountOptionsCache from '@salesforce/apex/DataServiceCtrl.getAccountOptionsCache';

export default class LwcAccountSelector extends LightningElement {
  @track topAccounts;

  @wire(CurrentPageReference) pageRef;

  @wire(getAccountOptionsCache)
  wiredOptionsCache({ error, data }) {
    if (data) {
      this.topAccounts = data.items;
    }
  }

  handleAccountOptionSelected(event) {
    fireEvent(this.pageRef, 'accountSelected', event.target.value); // an accountId value from lightning-combobox
  }
}