*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_prch_buffer DEFINITION FINAL CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS: get_instance RETURNING VALUE(ro_instance) TYPE REF TO lcl_prch_buffer.

PRIVATE SECTION.
    CLASS-DATA go_instance TYPE REF TO lcl_prch_buffer.

METHODS _create IMPORTING it_purchaseDocument  TYPE zif_prchdc_logic=>tt_purchasedocument
                    EXPORTING et_purchaseDocument  TYPE zif_prchdc_logic=>tt_purchasedocument
                              et_messages TYPE zif_prchdc_logic=>tt_if_t100_message.

ENDCLASS.

CLASS lcl_prch_buffer IMPLEMENTATION.
  METHOD get_instance.
    go_instance = COND #( WHEN go_instance IS BOUND THEN go_instance ELSE NEW #( ) ).
    ro_instance = go_instance.
  ENDMETHOD.

  METHOD _create.
    CLEAR et_purchaseDocument.
    CLEAR et_messages.
  ENDMETHOD.

ENDCLASS.
