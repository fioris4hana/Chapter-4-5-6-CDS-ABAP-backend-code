@AbapCatalog.sqlViewName: 'ZCPURCHDOCITMOVP'
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pending Purchase Documents item list'

@VDM.viewType: #CONSUMPTION

@Metadata.allowExtensions: true

define view Z_C_PurchaseDocumentPendingOVP
  as select from Z_I_PurchaseDocumentItem
{
  key PurchaseDocument,
  key PurchaseDocumentItem,
  _PurchaseDocument.Description as PurchaseDocumentDescription,
      Description,
      OverallItemPrice,
      Quantity,
      QuantityUnit,
      crea_uname,
      crea_date_time,
      Currency,
      _PurchaseDocument.Priority,
      _PurchaseDocument.Status,
      _PurchaseDocument._Priority.PriorityText as PriorityText,
      _PurchaseDocument._Status.StatusText     as StatusText,
      _PurchaseDocument.PurchasingOrganization,

      _PurchaseDocument


}
where
  _PurchaseDocument.Status = '1'
