@AbapCatalog.sqlViewName: 'ZIPURCHDOCITEMTP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Document Item'

@ObjectModel.writeActivePersistence: 'ZPURCHDOCITEM'

@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

@VDM.viewType: #COMPOSITE

define view Z_I_PurchaseDocumentItemTP
  as select from Z_I_PurchaseDocumentItem
  association [0..1] to Z_I_PurchaseDocumentTP as _PurchaseDocument on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument
{

      //Z_I_PurchaseDocumentItem
  key PurchaseDocumentItem,
  key PurchaseDocument,
      Description,
      Vendor,
      VendorType,
      Price,
      Currency,
      Quantity,
      QuantityUnit,
      @ObjectModel.readOnly: true
      OverallItemPrice,     
      PurchaseDocumentItemImageURL,

      // BOPF Admin Data
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      //Z_I_PurchaseDocumentItem
      _Currency,
      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _PurchaseDocument,
      _QuantityUnitOfMeasure

}
