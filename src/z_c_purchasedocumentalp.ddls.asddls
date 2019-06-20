@AbapCatalog.sqlViewName: 'ZCPRCHDOCCUBE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Documents ALP'
@Metadata.allowExtensions:true
@Analytics.query: true
@OData.publish: true
@VDM.viewType: #CONSUMPTION
define view Z_C_PurchaseDocumentALP as select from Z_I_PurchaseDocumentCube
{
  @AnalyticsDetails.query.display: #KEY_TEXT
  @ObjectModel.text.element:'PurchaseDocumentName'
  @Consumption.semanticObject: 'PurchasingDocument'
key  PurchaseDocument,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Purchase Document Item'
  @ObjectModel.text.element:'Description'
key  PurchaseDocumentItem,
  @EndUserText.label: 'Purchase Document Item Name'
  Description,
  @EndUserText.label: 'Price'
  Price,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Priority'
  Priority,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Status'
  Status,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Vendor'
  Vendor,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Vendor Type'
  VendorType,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @EndUserText.label: 'Purchasing Organization'
  PurchasingOrganization,
  @EndUserText.label: 'Number of Document Items'
  NumberOfDocuments,
  @EndUserText.label: 'Quantity'
  Quantity,
  @EndUserText.label: 'Overall Item Price'
  OverallItemPrice,
  @EndUserText.label: 'Created On'
  CreatedOn

}
