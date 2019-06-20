@AbapCatalog.sqlViewName: 'ZIPURCHDOCITEM'
@EndUserText.label: 'Purchase Document Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'PurchaseDocumentItem'
@ObjectModel.semanticKey: ['PurchaseDocumentItem','PurchaseDocument']
@Analytics: { dataCategory: #DIMENSION }

define view Z_I_PurchaseDocumentItem
  as select from zpurchdocitem
  association [1..1] to Z_I_PurchaseDocument as _PurchaseDocument      on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument
  association [0..1] to I_UnitOfMeasure      as _QuantityUnitOfMeasure on $projection.QuantityUnit = _QuantityUnitOfMeasure.UnitOfMeasure
  association [0..1] to I_Currency           as _Currency              on $projection.Currency = _Currency.Currency
{

      @ObjectModel.text.element: ['Description']
  key purchasedocumentitem as PurchaseDocumentItem,

      @ObjectModel.foreignKey.association: '_PurchaseDocument'
  key purchasedocument     as PurchaseDocument,

      @Semantics.text: true
      description          as Description,

      vendor               as Vendor,
      vendortype           as VendorType,


      /*
      It is assumed that all amount values shall be handled as measures by default. Amount values that shall not be handled as measures shall explicitly be annotated with @DefaultAggregation:#NONE.
      */
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #NONE
      price                as Price,
      @Semantics.currencyCode: true
      @ObjectModel.foreignKey.association: '_Currency'
      currency             as Currency,


      /*
      It is assumed that all quantity values shall be handled as measures by default. Quantity values that shall not be handled as measures shall explicitly be annotated with @DefaultAggregation:#NONE.
      */
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @DefaultAggregation: #NONE
      quantity             as Quantity,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_QuantityUnitOfMeasure'
      quantityunit         as QuantityUnit,


      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #NONE
      quantity  *   price  as OverallItemPrice,
      
      @Semantics.imageUrl: true
      purchasedocumentitemimageurl as PurchaseDocumentItemImageURL,

      // BOPF Admin Data
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      // Associations
      _PurchaseDocument,
      _QuantityUnitOfMeasure,
      _Currency

}
