CLASS zcl_create_test_data_purch_doc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS clean.
    METHODS create_purchase_documents.
    METHODS create_purchase_document_items.
    METHODS create_purch_doc_priorities.
    METHODS create_purch_doc_status.
    METHODS create_purch_organization.

ENDCLASS.



CLASS zcl_create_test_data_purch_doc IMPLEMENTATION.

  METHOD create_purchase_documents.
    DATA: lt_purch_docs TYPE STANDARD TABLE OF zpurchdocument.

    DATA lv_time_stamp_utc TYPE timestampl.
    GET TIME STAMP FIELD lv_time_stamp_utc.

    lt_purch_docs = VALUE #(
    ( purchasedocument = '1' crea_uname = 'John Doe' crea_date_time = lv_time_stamp_utc description = 'Company Car Purchase' status = '1' priority = '1'
    lchg_date_time = lv_time_stamp_utc lchg_uname = 'John Doe' purchasingorganization = 'ORG1' purchasedocumentimageurl = './images/car.jpg'  )
    ( purchasedocument = '2' crea_uname = 'Marissa May' crea_date_time = lv_time_stamp_utc description = 'Hardware Purchase' status = '1' priority = '2'
    lchg_date_time = lv_time_stamp_utc lchg_uname = 'Marissa May' purchasingorganization = 'ORG2' purchasedocumentimageurl = './images/laptop.jpg'   )
    ( purchasedocument = '3' crea_uname = 'Mike Smith' crea_date_time = lv_time_stamp_utc description = 'Book Purchase' status = '1'  priority = '3'
    lchg_date_time = lv_time_stamp_utc lchg_uname = 'Mike Smith' purchasingorganization = 'ORG3' purchasedocumentimageurl = './images/book.jpg'  ) ).

    INSERT zpurchdocument FROM TABLE lt_purch_docs.
  ENDMETHOD.


  METHOD create_purchase_document_items.
    DATA: lt_purch_doc_items TYPE STANDARD TABLE OF zpurchdocitem.

    DATA lv_time_stamp_utc TYPE timestampl.
    GET TIME STAMP FIELD lv_time_stamp_utc.

    lt_purch_doc_items = VALUE #(
        ( purchasedocument = '1' purchasedocumentitem = '1' crea_uname = 'John Doe' crea_date_time = lv_time_stamp_utc description = 'Tires' price = '300.00' currency = 'EUR' quantity = '4' quantityunit = 'PC'
        vendor = 'Miller Cars' vendortype = 'External' lchg_date_time = lv_time_stamp_utc lchg_uname = 'John Doe' purchasedocumentitemimageurl = './images/car.jpg'  )
        ( purchasedocument = '1' purchasedocumentitem = '2' crea_uname = 'John Doe' crea_date_time = lv_time_stamp_utc description = 'Company Car' price = '40000' currency = 'EUR' quantity = '1' quantityunit = 'PC'
        vendor = 'Miller Cars' vendortype = 'External' lchg_date_time = lv_time_stamp_utc lchg_uname = 'John Doe' purchasedocumentitemimageurl = './images/car.jpg'  )

        ( purchasedocument = '2' purchasedocumentitem = '1' crea_uname = 'Marissa May' crea_date_time = lv_time_stamp_utc description = 'Screen' price = '200.00' currency = 'EUR' quantity = '2' quantityunit = 'PC'
        vendor = 'Doe Computers' vendortype = 'Internal' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Marissa May' purchasedocumentitemimageurl = './images/screen.jpg' )
        ( purchasedocument = '2' purchasedocumentitem = '2' crea_uname = 'Marissa May' crea_date_time = lv_time_stamp_utc description = 'Keyboard' price = '100.00' currency = 'EUR' quantity = '1' quantityunit = 'PC'
 vendor = 'Doe Computers' vendortype = 'Internal' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Marissa May' purchasedocumentitemimageurl = './images/keyboard.jpg'     )
        ( purchasedocument = '2' purchasedocumentitem = '3' crea_uname = 'Marissa May' crea_date_time = lv_time_stamp_utc description = 'Mouse' price = '50.00' currency = 'EUR' quantity = '1' quantityunit = 'PC' vendor = 'Doe Computers'
 vendortype = 'Internal' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Marissa May'  purchasedocumentitemimageurl = '../images/mouse.jpg'  )
        ( purchasedocument = '2' purchasedocumentitem = '4' crea_uname = 'Marissa May' crea_date_time = lv_time_stamp_utc description = 'Computer' price = '500.00' currency = 'EUR' quantity = '1' quantityunit = 'PC'
 vendor = 'Doe Computers' vendortype = 'Internal' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Marissa May'  purchasedocumentitemimageurl = './images/laptop.jpg'  )

        ( purchasedocument = '3' purchasedocumentitem = '1' crea_uname = 'Mike Smith' crea_date_time = lv_time_stamp_utc description = 'SAP Press - Fiori' price = '50.00' currency = 'EUR' quantity = '1' quantityunit = 'PC'
        vendor = 'SAP Press' vendortype = 'Partner' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Mike Smith'  purchasedocumentitemimageurl = './images/book.jpg'  )
        ( purchasedocument = '3' purchasedocumentitem = '2' crea_uname = 'Mike Smith' crea_date_time = lv_time_stamp_utc description = 'SAP Press - HANA' price = '50.00' currency = 'EUR' quantity = '1' quantityunit = 'PC'
        vendor = 'SAP Press' vendortype = 'Partner' lchg_date_time = lv_time_stamp_utc lchg_uname = 'Mike Smith' purchasedocumentitemimageurl = './images/book.jpg'   )
         ).

    INSERT zpurchdocitem FROM TABLE lt_purch_doc_items.
  ENDMETHOD.


  METHOD create_purch_doc_priorities.
    DATA: lt_purch_doc_prios TYPE STANDARD TABLE OF zpurchdocprio.

    lt_purch_doc_prios = VALUE #(
      ( priority = '1' prioritytext = 'High' )
      ( priority = '2' prioritytext = 'Medium' )
      ( priority = '3' prioritytext = 'Low' )
     ).

    INSERT zpurchdocprio FROM TABLE lt_purch_doc_prios.
  ENDMETHOD.


  METHOD create_purch_doc_status.
    DATA: lt_purch_doc_status TYPE STANDARD TABLE OF zpurchdocstatus.

    lt_purch_doc_status = VALUE #(
      ( status = '1' statustext = 'Created' )
      ( status = '2' statustext = 'Approved' )
      ( status = '3' statustext = 'Closed' )
     ).

    INSERT zpurchdocstatus FROM TABLE lt_purch_doc_status.
  ENDMETHOD.

  METHOD create_purch_organization.
    DATA: lt_purch_org TYPE STANDARD TABLE OF zpurchorg.

    lt_purch_org = VALUE #(
      ( purchasingorganization = 'ORG1' description = 'Purchasing Organization 1' emailaddress = 'purchorg1@org.com' phonenumber = '0035235-2364646' faxnumber = '342623-2575472' )
      ( purchasingorganization = 'ORG2' description = 'Purchasing Organization 2' emailaddress = 'purchorg2@org.com'  phonenumber = '0035235-3461347' faxnumber = '342623-43634' )
      ( purchasingorganization = 'ORG3' description = 'Purchasing Organization 3' emailaddress = 'purchorg3@org.com' phonenumber = '0035235-575347' faxnumber = '342623-327545427' )
     ).

    INSERT zpurchorg FROM TABLE lt_purch_org.
  ENDMETHOD.


  METHOD clean.
    DELETE FROM zpurchdocument.
    DELETE FROM zpurchdocitem.
    DELETE FROM zpurchdocprio.
    DELETE FROM zpurchdocstatus.
    DELETE FROM zpurchorg.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    clean( ).
    create_purchase_documents( ).
    create_purchase_document_items( ).
    create_purch_doc_priorities( ).
    create_purch_doc_status( ).
    create_purch_organization( ).

    out->write(
      EXPORTING
        data   = 'Test data creation done.'
    ).

  ENDMETHOD.





ENDCLASS.
