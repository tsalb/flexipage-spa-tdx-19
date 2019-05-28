```jsx

/* LWC communicate to Aura */
<aura:component>
  <c:EventService aura:id="eventService"/>
  <c:MessageService aura:id="messageService"/>
  <c:lwcAccountSelector aura:id="lwc-account-selector"
    onauramessage="{! c.handleLwcMessage }">
  </c:lwcAccountSelector>
</aura:component>

// Aura communicate to LWC
sendMessageDown : function(component, event, helper) {
  let webComponent = component.find("lwc-account-selector");
  let payload = component.get("v.myAttribute);
  webComponent.callApiFunction(payload);
}