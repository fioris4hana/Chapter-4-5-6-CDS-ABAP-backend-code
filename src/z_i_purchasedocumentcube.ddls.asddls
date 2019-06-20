@AbapCatalog.sqlViewName: 'ZIPURCHDOCCUBEVW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Document Cube View'
@Analytics: { dataCategory: #CUBE }

@VDM.viewType: #COMPOSITE

define view Z_I_PurchaseDocumentCube
  as select from Z_I_PurchaseDocumentItem
{
      @ObjectModel.text.element: ['PurchaseDocumentName']
  key PurchaseDocument,
      @ObjectModel.text.element: ['Description']
  key PurchaseDocumentItem,
      @Semantics.text: true
      _PurchaseDocument.Description                              as                      PurchaseDocumentName,
      @Semantics.text: true
      Description,
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      OverallItemPrice,
      Currency,
      crea_date_time                                             as                      CreatedOn,
      crea_uname                                                 as                      username,
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      Price,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @DefaultAggregation: #SUM
      Quantity,
      QuantityUnit,
      cast(Vendor as abap.char( 32 ))                            as                      Vendor,
      cast(VendorType as abap.char( 32 ))                        as                      VendorType,

      @DefaultAggregation: #SUM
      1                                                          as                      NumberOfDocuments,
      _PurchaseDocument.PurchasingOrganization,
      _PurchaseDocument.Status,
      _PurchaseDocument.Priority,


      _PurchaseDocument,
      _PurchaseDocument._Priority,
      _PurchaseDocument._Status,
      _PurchaseDocument._PurchasingOrganization,
      _Currency,
      _QuantityUnitOfMeasure
}
