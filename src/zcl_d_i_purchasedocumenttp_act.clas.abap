CLASS zcl_d_i_purchasedocumenttp_act DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d_i_purchasedocumenttp_act IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

*    " The invoice's data is typed with BO node's combined table type
*    DATA lt_purchase_doc TYPE ztipurchasedocumenttp.
*    DATA lv_action_enabled TYPE abap_bool.
*
*    " (1) Retrieve the data of the invoice's node instance
*    io_read->retrieve(
*      EXPORTING
*        iv_node  = is_ctx-node_key
*        it_key   = it_key
*      IMPORTING
*        et_data = lt_purchase_doc ).
*
*
*    " (2) Create a property helper object
*
*    DATA(lo_property_helper) = NEW /bobf/cl_lib_h_set_property( io_modify  = io_modify
*                                                            is_context = is_ctx ).
*
*
*
*    " (3) Action not enabled when invoice is set to PAID
*    LOOP AT lt_purchase_doc ASSIGNING FIELD-SYMBOL(<fs_purch_doc>).
*
*
*
*      lo_property_helper->set_action_enabled(
*            iv_action_key = zif_i_purchasedocumenttp_c=>sc_action-z_i_purchasedocumenttp-approve
*            iv_key        = <fs_purch_doc>-key
*            iv_value      = abap_true ).
*
*      lo_property_helper->set_action_enabled(
*          iv_action_key = zif_i_purchasedocumenttp_c=>sc_action-z_i_purchasedocumenttp-close
*          iv_key        = <fs_purch_doc>-key
*          iv_value      = abap_true ).
*
*    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
