CLASS zcl_object_factory_purch DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS ztcl_object_injector_purch .

  PUBLIC SECTION.
    CLASS-METHODS get_vendor_service
      RETURNING VALUE(ro_vendor_service) TYPE REF TO zif_vendor_service.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA go_vendor_service TYPE REF TO zif_vendor_service.
ENDCLASS.


CLASS zcl_object_factory_purch IMPLEMENTATION.
  METHOD get_vendor_service.
    IF go_vendor_service IS NOT BOUND.
      go_vendor_service = NEW zcl_vendor_service( ).
    ENDIF.
    ro_vendor_service = go_vendor_service.
  ENDMETHOD.
ENDCLASS.
