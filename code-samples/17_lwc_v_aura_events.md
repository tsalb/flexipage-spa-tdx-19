```jsx

/* Aura */
<c:EventService/>

helper.eventService(component).fireAppEvent('KEY', 'VALUE');

<aura:handler event="c:ServiceAppEvent" action="{! c.handleApplicationEvent }"/>

handleApplicationEvent : function(component, event, helper) {
  let params = event.getParams();
  // params.appEventValue = 'VALUE'
}

/* LWC */
import { fireEvent } from 'c/pubsub';

fireEvent(this.pageRef, 'KEY', 'VALUE');

import { registerListener } from 'c/pubsub';

registerListener('KEY', this.handlePubSubEvent, this);

handlePubSubEvent(incomingValue) {
  // incomingValue = 'VALUE'
}