CLASS zcl_prchdc_logic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_prchdc_logic.

    TYPES: BEGIN OF ENUM ty_change_mode STRUCTURE change_mode," Key checks are done separately
             create,
             update," Only fields that have been changed need to be checked
           END OF ENUM ty_change_mode STRUCTURE change_mode.

    CLASS-METHODS: get_instance RETURNING VALUE(ro_instance) TYPE REF TO zcl_prchdc_logic.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA go_instance TYPE REF TO zcl_prchdc_logic.
ENDCLASS.



CLASS zcl_prchdc_logic IMPLEMENTATION.

  METHOD get_instance.
    go_instance = COND #( WHEN go_instance IS BOUND THEN go_instance ELSE NEW #( ) ).
    ro_instance = go_instance.
  ENDMETHOD.


ENDCLASS.
