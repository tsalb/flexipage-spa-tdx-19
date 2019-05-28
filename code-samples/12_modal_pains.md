```jsx

/* AnyComponent.cmp VERSION ONE - Everything by hand */
<lightning:overlayLibrary aura:id="overlayLib"/>
<lightning:button label="Show Modal" onclick="{! c.handleShowModal }"/>

// AnyComponentController.js
handleShowModal : function (component, event, helper) {
  let modalBody;
  let modalFooter;
  $A.createComponents(
    // Argument one, desired components
    [
      ["c:modalBody",{}],
      ["c:modalFooter",{}]
    ],
    // Argument two, callback function
    function(components, status) {
      if (status === "SUCCESS") {
        modalBody = components[0];
        modalFooter = components[1];
        component.find('overlayLib').showCustomModal({
          header: "Painstakingly Created Modal",
          body: modalBody,                                    // Sibling to Footer
          footer: modalFooter                                 // Sibling to Body
        });
      }
    }
  );
}