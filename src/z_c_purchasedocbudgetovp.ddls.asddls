@AbapCatalog.sqlViewName: 'ZPUCHDOCBUDGT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OVP card for Overall Budget'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions:true

define view Z_C_PurchaseDocBudgetOVP
  as select from Z_I_PurchaseDocumentTP
{
  @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDocument,
      crea_date_time,
      PurchasingOrganization,
      OverallPrice,
      @Semantics.quantity.unitOfMeasure: 'Percentage'
      division(OverallPrice * 100, 10000, 2) as BudgetUtilization,
      Status,
      Priority,
      @Semantics.unitOfMeasure: true
      cast(' % ' as abap.unit(3))            as Percentage
}
