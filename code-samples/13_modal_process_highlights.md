```jsx

/* AnyComponent.cmp VERSION TWO - MessageService */
<c:MessageService aura:id="messageService"/>
<lightning:button label="Show Modal" onclick="{! c.handleShowModal }"/>

// AnyComponentController.js
handleShowModal : function (component, event, helper) {
  helper.messageService(component).modal(
    "some-aura-id",                                       // aura:id
    "Easily Created Modal",                               // headerLabel
    "c:modalBody",                                        // dynamically created body
    {                                                     // dynamic params into body
      objectAttrOnBody: {
        foo: 'Hello',
        bar: 'World'
      },
      boolAttrOnBody: true,
      callingRecordId: component.get("v.recordId")
    },
    "c.controllerFunctionOnModalBody",                    // footer uses this to component.getReference() body function
    "MainActionLabel"                                     // footer action label, fires body function
  );
}