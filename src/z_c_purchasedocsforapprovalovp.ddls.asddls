@AbapCatalog.sqlViewName: 'ZCPURHPNDNGAPRVL'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase orders Pending for Approval'
@Metadata.allowExtensions:true
@VDM.viewType: #CONSUMPTION
define view Z_C_PurchaseDocsforApprovalOVP
  as select from Z_I_PurchaseDocAprovalStat
{
      @ObjectModel.foreignKey.association: '_PurchaseDocument'
      @Consumption.semanticObject: 'PurchasingDocument'
  key  PurchaseDocument,
       Description,
       OverallPrice,
       Priority,
       crea_uname,
       _Priority.PriorityText,
       Status,
       PurchasingOrganization,
       Approval
}
where
      Status       = '1'
  and OverallPrice > 1000
