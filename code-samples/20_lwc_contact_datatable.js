import { LightningElement, wire } from 'lwc';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import wireContactsByAccountId  from '@salesforce/apex/DataServiceCtrl.wireContactsByAccountId';

export default class LwcContactDatatable extends LightningElement {
  // private
  _accountId;

  @wire(CurrentPageReference)pageRef;

  @wire(wireContactsByAccountId, { accountId: '$_accountId' })
  contacts;

  connectedCallback() {
    registerListener('accountSelected', this.handleAccountSelected, this);
  }

  disconnectedCallback() {
    unregisterAllListeners(this);
  }

  handleAccountSelected(accountId) {
    this._accountId = accountId;
  }
}