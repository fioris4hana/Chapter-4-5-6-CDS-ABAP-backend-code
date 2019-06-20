"! @testing Z_C_PurchaseDocumentLrp
CLASS ltcl_z_c_purhcasedocumentlrp DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    CLASS-DATA: environment TYPE REF TO if_cds_test_environment.
    CLASS-METHODS: class_setup RAISING cx_static_check, class_teardown.
    METHODS setup.
    METHODS some_test_method FOR TESTING RAISING cx_static_check.
    DATA: test_data                 TYPE REF TO if_cds_test_data,
          lt_z_i_purchasedocumenttp TYPE STANDARD TABLE OF z_i_purchasedocumenttp.
ENDCLASS.


CLASS ltcl_z_c_purhcasedocumentlrp IMPLEMENTATION.
  METHOD class_setup.
    "corresponding doubles and clone(s) for the CDS view under test and its dependencies, are created here
    environment  = cl_cds_test_environment=>create( 'Z_C_PURCHASEDOCUMENTLRP' ).
  ENDMETHOD.

  METHOD setup.
    "clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    "Generated database entities (doubles & clones) should be deleted at the end of test class execution.
    environment->destroy( ).
  ENDMETHOD.

  METHOD some_test_method.
    " given
    lt_z_i_purchasedocumenttp = VALUE #( ( ) ).
    environment->insert_test_data( i_data = lt_z_i_purchasedocumenttp ).
    " when
    SELECT * FROM z_c_purchasedocumentlrp INTO TABLE @DATA(act_results).
    " then
    cl_abap_unit_assert=>fail( msg = 'Place your assertions here' ).
  ENDMETHOD.

ENDCLASS.
