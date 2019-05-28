```jsx

// WISHLIST - Version ONE
let eventService = component.find('eventService');                                  // Find and assign

eventService.fireCompEvent('HEY_LISTEN');                                           // Short and sweet

// Variation 1
eventService.fireCompEvent('HEY_LISTEN_HERE', 'Hello World');                       // With simple payload

// Variation 2
eventService.fireCompEvent('HEY_LISTEN_THERE', {                                    // With complex payload
  foo: 'Hello',
  bar: 'World'
});

// WISHLIST - Version ONE POINT FIVE
helper.eventService(component).fireCompEvent('HEY_LISTEN');                         // 1) One-liner

helper.eventService(component).fireCompEvent('HEY_LISTEN', 'Hello World');          // 2) One-liner...with payload

/* Child.cmp */
<c:EventService aura:id="eventService"/>                                            // Sidebar... child needs access somehow

// ParentController.js
handleComponentEvent : function(component, event, helper) {
  // TODO, no idea how yet!
}