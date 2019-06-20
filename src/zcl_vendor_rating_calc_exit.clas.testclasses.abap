CLASS ltcl_vendor_rating_calc_exit DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      vendor_rating_selected FOR TESTING RAISING cx_sadl_exit,
      unknown_calc_field FOR TESTING RAISING cx_sadl_exit,
      unkown_entity FOR TESTING RAISING cx_sadl_exit,
      get_rating_for_vendor FOR TESTING RAISING cx_sadl_exit.

ENDCLASS.


CLASS ltcl_vendor_rating_calc_exit IMPLEMENTATION.

  METHOD vendor_rating_selected.
    " If VendorRating is requested we must also read the Vendor
    DATA(lo_vendor_rating_calc_exit) = NEW zcl_vendor_rating_calc_exit( ).

    lo_vendor_rating_calc_exit->if_sadl_exit_calc_element_read~get_calculation_info(
      EXPORTING
        it_requested_calc_elements = VALUE #(  ( `VENDORRATING` )  )
        iv_entity                  = 'Z_C_PURCHASEDOCUMENTITEMLRP'
      IMPORTING
        et_requested_orig_elements = DATA(lt_requested_orig_elements)
    ).

    cl_abap_unit_assert=>assert_table_contains( line = `VENDOR` table = lt_requested_orig_elements ).
  ENDMETHOD.

  METHOD unknown_calc_field.
    NEW zcl_vendor_rating_calc_exit( )->if_sadl_exit_calc_element_read~get_calculation_info(
      EXPORTING
        it_requested_calc_elements = VALUE #(  ( `UNKNOWN` )  )
        iv_entity                  = 'Z_C_PURCHASEDOCUMENTITEMLRP'
      IMPORTING
        et_requested_orig_elements = DATA(lt_requested_orig_elements)
    ).

    cl_abap_unit_assert=>assert_table_not_contains( line = `VENDOR` table = lt_requested_orig_elements ).
  ENDMETHOD.

  METHOD unkown_entity.
    TRY.
        NEW zcl_vendor_rating_calc_exit( )->if_sadl_exit_calc_element_read~get_calculation_info(
          EXPORTING
            it_requested_calc_elements = VALUE #(  ( `VENDORRATING` )  )
            iv_entity                  = 'UnknownEntity'
          IMPORTING
            et_requested_orig_elements = DATA(lt_requested_orig_elements)
        ).
        cl_abap_unit_assert=>fail(  msg = 'zcx_unknown_entity not raised'
                              level = if_aunit_constants=>critical ).

      CATCH zcx_unknown_entity.
    ENDTRY.
  ENDMETHOD.


  METHOD get_rating_for_vendor.
    " Arrange
    DATA lt_original_data TYPE STANDARD TABLE OF z_c_purchasedocumentitemlrp.
    lt_original_data = VALUE #( ( purchasedocument = '1' purchasedocumentitem = '1' vendor = 'VendorA' ) ).

    DATA lt_calculated_data TYPE STANDARD TABLE OF z_c_purchasedocumentitemlrp.
    lt_calculated_data = VALUE #(  ).

    " (1) Create the test double of interface type
    DATA tdo_vendor_service
        TYPE REF TO zif_vendor_service.
    tdo_vendor_service ?= cl_abap_testdouble=>create(
        'zif_vendor_service' ).

    " (2) Configure the test double behavior
    cl_abap_testdouble=>configure_call(
        tdo_vendor_service )->returning( 5 ).

    " (3) Configure the test double method
    tdo_vendor_service->get_vendor_rating(
        iv_vendor = 'VendorA' ).

    " (4) Inject the test double
    ztcl_object_injector_purch=>inject_vendor_service(
        tdo_vendor_service ).

    "Act
    NEW zcl_vendor_rating_calc_exit( )->if_sadl_exit_calc_element_read~calculate(
      EXPORTING
        it_original_data           = lt_original_data
        it_requested_calc_elements = VALUE #(  ( `VENDORRATING` )  )
      CHANGING
        ct_calculated_data         = lt_calculated_data
    ).
    " Assert
    DATA lt_expected_calulcated_data TYPE STANDARD TABLE OF z_c_purchasedocumentitemlrp.
    lt_expected_calulcated_data = VALUE #(
        ( purchasedocument = '1' purchasedocumentitem = '1' vendor = 'VendorA' vendorrating = 5 ) ).

    cl_abap_unit_assert=>assert_equals( act = lt_calculated_data exp = lt_expected_calulcated_data ).
  ENDMETHOD.

ENDCLASS.
