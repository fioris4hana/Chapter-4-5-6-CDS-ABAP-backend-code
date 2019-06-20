CLASS zcl_vendor_rating_calc_exit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_vendor_rating_calc_exit IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    IF iv_entity <> 'Z_C_PURCHASEDOCUMENTITEMLRP'.
      RAISE EXCEPTION TYPE zcx_unknown_entity.
    ENDIF.
    IF line_exists( it_requested_calc_elements[ table_line = 'VENDORRATING' ] ).
      APPEND 'VENDOR' TO et_requested_orig_elements.
    ENDIF.
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.
    CHECK it_original_data IS NOT INITIAL.

    IF line_exists( it_requested_calc_elements[ table_line = 'VENDORRATING' ] ).
      DATA lt_calculated_data TYPE STANDARD TABLE OF z_c_purchasedocumentitemlrp.
      MOVE-CORRESPONDING it_original_data TO lt_calculated_data.

      LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<fs_calculated_data>).
        <fs_calculated_data>-vendorrating =
            zcl_object_factory_purch=>get_vendor_service( )->get_vendor_rating(
                 iv_vendor = <fs_calculated_data>-vendor  ).
      ENDLOOP.
      MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
