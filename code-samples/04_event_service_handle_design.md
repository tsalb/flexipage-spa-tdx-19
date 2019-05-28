```jsx

/* Parent.cmp */
<aura:handler event="c:ServiceCompEvent" action="{! c.handleComponentEvent }"/>

// ParentController.js
handleComponentEvent : function(component, event, helper) {
  let params = event.getParams();
  switch(params.compEventKey) {
    case "HEY_LISTEN":
      helper.doSomethingCool(); // no payload
      break;
    case "HEY_LISTEN_HERE":
      let payload = params.compEventValue;
      console.log(payload);     // 'Hello World'
      break;
    case "HEY_LISTEN_THERE":
      let payload = params.compEventValue;
      console.log(payload.foo); // 'Hello'
      console.log(payload.bar); // 'World'
      break;
  }
}