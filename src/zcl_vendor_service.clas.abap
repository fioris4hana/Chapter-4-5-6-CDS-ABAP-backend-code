CLASS zcl_vendor_service DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_object_factory_purch.

  PUBLIC SECTION.

    INTERFACES zif_vendor_service.

    ALIASES get_vendor_rating FOR zif_vendor_service~get_vendor_rating.

    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES: BEGIN OF sty_vendor_rating,
             vendor        TYPE string,
             vendor_rating TYPE i,
           END OF sty_vendor_rating.


    DATA mt_vendor_rating_buffer TYPE HASHED TABLE OF sty_vendor_rating WITH UNIQUE KEY vendor.

    DATA mo_random_int TYPE REF TO cl_abap_random_int.

ENDCLASS.



CLASS zcl_vendor_service IMPLEMENTATION.

  METHOD constructor.
    mo_random_int = cl_abap_random_int=>create(
                           seed = cl_abap_random=>seed( )
                           min  = 1
                           max  = 5
                         ).
  ENDMETHOD.

  METHOD get_vendor_rating.
    IF line_exists( mt_vendor_rating_buffer[ vendor = iv_vendor ] ).
      rv_vendor_rating = mt_vendor_rating_buffer[ vendor = iv_vendor ]-vendor_rating.
    ELSE.
      rv_vendor_rating = mo_random_int->get_next( ).
      INSERT VALUE sty_vendor_rating( vendor = iv_vendor vendor_rating = rv_vendor_rating ) INTO TABLE mt_vendor_rating_buffer.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
