@AbapCatalog.sqlViewName: 'ZCPURCHDOCOVP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Over View Page'

@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: 'PurchaseDocument'

define view Z_C_PurchaseDocumentOVP
  as select from Z_I_PurchaseDocument
  association [0..1] to Z_I_PurchaseDocumentPriority as _Priority on $projection.Priority = _Priority.Priority
  association [0..1] to Z_I_PurchaseDocumentStatus   as _Status   on $projection.Status = _Status.Status
{
  @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDocument,
      Description,
      Priority,
      _Priority.PriorityText,
      Status,
      _Status.StatusText,
      @DefaultAggregation: #SUM
      cast( 1 as eam_num_orders_outstanding ) as TotalNumberofDocuments,

      _Priority,
      _Status
}
