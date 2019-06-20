@AbapCatalog.sqlViewName: 'ZCPURCHDOCITLRP'
@EndUserText.label: 'Purchase Document'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@ObjectModel.representativeKey: 'PurchaseDocumentItem'
@ObjectModel.semanticKey: [ 'PurchaseDocumentItem','PurchaseDocument' ]


@Metadata.allowExtensions:true

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

@VDM.viewType: #CONSUMPTION

define view Z_C_PurchaseDocumentItemLrp
  as select from Z_I_PurchaseDocumentItemTP
  association [0..1] to Z_C_PurchaseDocumentLrp as _PurchaseDocument on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument
{

      @ObjectModel.foreignKey.association: '_PurchaseDocument'
      @EndUserText.label: 'Purchase Document'
  key PurchaseDocument,
      @EndUserText.label: 'Purchase Document Item'
  key PurchaseDocumentItem,

      Price,

      Quantity,
      @EndUserText.label: 'Overall Item Price'
      OverallItemPrice,

      Vendor,

      @EndUserText.label: 'Vendor Type'
      VendorType,

      Description,

      Currency,

      QuantityUnit,

      @EndUserText.label: 'Image'
      @Consumption.filter.hidden: true
      PurchaseDocumentItemImageURL,


      @EndUserText.label: 'Vendor Rating'
      @ObjectModel.readOnly: true
      @ObjectModel.virtualElement: true
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VENDOR_RATING_CALC_EXIT'
      0 as VendorRating,


      // BOPF Admin Data
      @EndUserText.label: 'Created at'
      crea_date_time,
      @EndUserText.label: 'Created by'
      crea_uname,
      @EndUserText.label: 'Last changed at'
      lchg_date_time,
      @EndUserText.label: 'Last changed by'
      lchg_uname,


      /* Associations */
      _Currency,
      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _PurchaseDocument,
      _QuantityUnitOfMeasure
}
