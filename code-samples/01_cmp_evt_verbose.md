```jsx

/* myEvent.evt */
<aura:event type="COMPONENT">
  <aura:attribute name="message" type="String"/>                                    // 1) Create (per event!)
</aura:event>

/* notifier.cmp */
<aura:component>
  <aura:registerEvent name="componentEvt" type="c:myEvent"/>                        // 2) Register
  <lightning:button onclick="{! c.fireComponentEvent }"/>
</aura:component>

// notifierController.js
fireComponentEvent : function(component, event) {
  let myEvt = component.getEvent("componentEvt");                                   // 3) Grab
  myEvt.setParams({ message: "Hello World" });                                      // 4) Parameterize
  myEvt.fire();                                                                     // 5) Fire
}

/* listener.cmp */
<aura:component>
  <aura:handler name="componentEvt" event="c:myEvent" 
    action="{! c.handleComponentEvent }"/>                                          // 6) Scope and Handle, so many steps!
  <c:notifier/>
</aura:component>

// listenerController.js
handleComponentEvent : function(component, event) {
  let message = event.getParam("message");                                          // 7) Get and use, finally!
  console.log(message) // hello world
}
