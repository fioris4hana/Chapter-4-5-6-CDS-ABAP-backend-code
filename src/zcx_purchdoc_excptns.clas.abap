class ZCX_PURCHDOC_EXCPTNS definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .

  constants:
*  data CURRENCY_CODE_IS_INITIAL .
    BEGIN OF CURRENCY_CODE_IS_INITIAL,
        msgid TYPE symsgid VALUE 'PURCHDOC/CURR',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_CURRENCY_CODE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF CURRENCY_CODE_IS_INITIAL .
  constants:
    BEGIN OF STATUS_IS_NOT_VALID,
        msgid TYPE symsgid VALUE 'PURCHDOC/STATUS',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_STAT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF STATUS_IS_NOT_VALID .
  constants:
    BEGIN OF PRIORITY_IS_NOT_VALID,
        msgid TYPE symsgid VALUE 'PURCHDOC/PRIO',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_PRIORITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF PRIORITY_IS_NOT_VALID .
  constants:
    BEGIN OF NO_CREATED_DATE,
        msgid TYPE symsgid VALUE 'PURCHDOC/CRTEDATE',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_CREATE_DATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF NO_CREATED_DATE .
  constants:
    BEGIN OF VENDOR_UNKOWN,
        msgid TYPE symsgid VALUE 'PURCHDOC/VEND',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_DENDOR',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF VENDOR_UNKOWN .
  constants:
    BEGIN OF VENDORTYPE_UNKOWN,
        msgid TYPE symsgid VALUE 'PURCHDOC/VENTYP',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_VENDOR_TYPE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
  END OF VENDORTYPE_UNKOWN .
  data MV_CURRENCY_CODE type TCURR_CURR .
  data MV_PRIORITY type /DMO/TRAVEL_STATUS .
  data MV_STATUS type /DMO/TRAVEL_STATUS .
  data MV_PURCHASEDOCUMENT type ZPURCHASEDOCUMENTDTEL .
  data MV_UNAME type SYUNAME .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !MV_CURRENCY_CODE type TCURR_CURR optional
      !MV_PRIORITY type /DMO/TRAVEL_STATUS optional
      !MV_STATUS type /DMO/TRAVEL_STATUS optional
      !MV_PURCHASEDOCUMENT type ZPURCHASEDOCUMENTDTEL optional
      !MV_UNAME type SYUNAME optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_PURCHDOC_EXCPTNS IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->MV_CURRENCY_CODE = MV_CURRENCY_CODE .
me->MV_PRIORITY = MV_PRIORITY .
me->MV_STATUS = MV_STATUS .
me->MV_PURCHASEDOCUMENT = MV_PURCHASEDOCUMENT .
me->MV_UNAME = MV_UNAME .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
