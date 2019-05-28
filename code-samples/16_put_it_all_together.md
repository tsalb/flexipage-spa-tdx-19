```xml

<!-- AccountSelector.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes">
  <c:DataService aura:id="service"/>
  <c:EventService aura:id="eventService"/>
  <c:MessageService aura:id="messageService"/>
  ...
</aura:component>




<!-- ContactDatatable.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes">
  <c:DataService aura:id="service"/>
  <c:EventService aura:id="eventService"/>
  <c:MessageService aura:id="messageService"/>
  ...
</aura:component>




<!-- CaseDatatable.cmp -->
<aura:component>
  <c:DataTableService aura:id="tableService"/>
  <c:EventService aura:id="eventService"/>
  <c:MessageService aura:id="messageService"/>
  ...
</aura:component>