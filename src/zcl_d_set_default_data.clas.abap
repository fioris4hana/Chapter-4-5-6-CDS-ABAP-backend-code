CLASS zcl_d_set_default_data DEFINITION
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



CLASS zcl_d_set_default_data IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA: lt_purch_doc      TYPE STANDARD TABLE OF zsipurchasedocumenttp,
          lv_time_stamp_utc TYPE timestampl.

    GET TIME STAMP FIELD lv_time_stamp_utc.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
        IMPORTING
        et_data = lt_purch_doc
    ).

    LOOP AT lt_purch_doc ASSIGNING FIELD-SYMBOL(<fs_purch_doc>).

      IF <fs_purch_doc>-crea_date_time IS INITIAL.
        <fs_purch_doc>-crea_date_time = lv_time_stamp_utc.
      ENDIF.

      IF <fs_purch_doc>-crea_uname IS INITIAL.
        <fs_purch_doc>-crea_uname = sy-uname.
      ENDIF.

      IF <fs_purch_doc>-status IS INITIAL.
        <fs_purch_doc>-status  = '1'. " Created
      ENDIF.

      IF <fs_purch_doc>-priority IS INITIAL.
        <fs_purch_doc>-status  = '3'. " Low
      ENDIF.

      <fs_purch_doc>-lchg_date_time = lv_time_stamp_utc.
      <fs_purch_doc>-lchg_uname = sy-uname.

      io_modify->update(
        EXPORTING
          iv_node           = is_ctx-node_key
          iv_key            = <fs_purch_doc>-key
          is_data           = REF #( <fs_purch_doc> )
      ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
