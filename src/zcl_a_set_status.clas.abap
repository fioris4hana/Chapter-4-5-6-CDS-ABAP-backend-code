CLASS zcl_a_set_status DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_a_set_status IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    DATA(lt_purchase_document) = VALUE ztipurchasedocumenttp( ).

    " Retrieve purchase document node instances to be approved
    io_read->retrieve(
      EXPORTING
        iv_node         = is_ctx-node_key
        it_key          = it_key
      IMPORTING
        et_data         = lt_purchase_document
    ).

    LOOP AT lt_purchase_document ASSIGNING FIELD-SYMBOL(<fs_purchase_document>).

      IF is_ctx-act_key = zif_i_purchasedocumenttp_c=>sc_action-z_i_purchasedocumenttp-approve
        AND <fs_purchase_document>-status = '1'. " Created
        <fs_purchase_document>-status = '2'. " Set status to Approved
      ELSEIF is_ctx-act_key = zif_i_purchasedocumenttp_c=>sc_action-z_i_purchasedocumenttp-close
      AND  ( <fs_purchase_document>-status = '1'
      OR <fs_purchase_document>-status = '2' ).
        <fs_purchase_document>-status = '3'. " Set status to Closed
      ELSE.
        " Status change is not possible
        APPEND VALUE /bobf/s_frw_key( key = <fs_purchase_document>-key )  TO et_failed_key.

        IF eo_message IS NOT BOUND.
          eo_message = /bobf/cl_frw_factory=>get_message( ).
        ENDIF.

        eo_message->add_message(
          EXPORTING
            is_msg       = VALUE #( msgty = 'E' msgid = 'ZPURCHASINGMESSAGES' msgno = '001' )
            iv_node      = is_ctx-node_key
            iv_key       = <fs_purchase_document>-key
        ).

        CONTINUE.
      ENDIF.


      " Update the changed status of the node instance
      io_modify->update(
        EXPORTING
          iv_node               = is_ctx-node_key
          iv_key                = <fs_purchase_document>-key
          iv_root_key           = <fs_purchase_document>-root_key
          is_data               = REF #( <fs_purchase_document> )
          it_changed_fields     = VALUE #(
            ( zif_i_purchasedocumenttp_c=>sc_node_attribute-z_i_purchasedocumenttp-status )
          )
        ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
