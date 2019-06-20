CLASS ztcl_object_injector_purch DEFINITION
  PUBLIC
  FOR TESTING
  FINAL
  CREATE PRIVATE .
  PUBLIC SECTION.
    CLASS-METHODS inject_vendor_service
      IMPORTING
        io_vendor_service_td
          TYPE REF TO zif_vendor_service.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ztcl_object_injector_purch IMPLEMENTATION.
  METHOD inject_vendor_service.
    zcl_object_factory_purch=>go_vendor_service =
        io_vendor_service_td.
  ENDMETHOD.
ENDCLASS.
