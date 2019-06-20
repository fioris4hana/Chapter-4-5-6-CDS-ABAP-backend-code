INTERFACE zif_vendor_service
  PUBLIC .

  METHODS: get_vendor_rating
    IMPORTING iv_vendor               TYPE string
    RETURNING VALUE(rv_vendor_rating) TYPE i.

ENDINTERFACE.
