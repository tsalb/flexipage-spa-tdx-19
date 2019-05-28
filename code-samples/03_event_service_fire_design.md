```jsx

/* ServiceCompEvent.evt */                                                          // One event to rule them all
<aura:event type="COMPONENT">
  <aura:attribute name="compEventKey" type="String"/>                               // Key
  <aura:attribute name="compEventValue" type="Object"/>                             // Value (optional)
</aura:event>

/* EventService.cmp */
<aura:registerEvent name="ServiceCompEvent" type="c:ServiceCompEvent"/>
<aura:registerEvent name="ServiceAppEvent" type="c:ServiceAppEvent"/>

<aura:method name="fireCompEvent" action="{! c.handleFireComponentEvent }">
  <aura:attribute name="eventKey" type="String"/>
  <aura:attribute name="eventValue" type="Object"/>
</aura:method>

<aura:method name="fireAppEvent" action="{! c.handleFireApplicationEvent }">        // Needed for crossing component boundaries
  <aura:attribute name="eventKey" type="String"/>
  <aura:attribute name="eventValue" type="Object"/>
</aura:method>

// EventServiceController.js
handleFireComponentEvent : function(component, event) {
  let params = event.getParam("arguments");
  let compEvent = component.getEvent("ServiceCompEvent");
  compEvent.setParams({
    compEventKey : params.eventKey,
    compEventValue : params.eventValue                                              // JS Objects are REALLY flexible
  });
  compEvent.fire();
},
handleFireApplicationEvent : function(component, event) {
  let params = event.getParam("arguments");
  let appEvent = $A.get("e.c:ServiceAppEvent");                                     // Different syntax, same mechanisms
  appEvent.setParams({
    appEventKey : params.eventKey,
    appEventValue : params.eventValue
  });
  appEvent.fire();
}
